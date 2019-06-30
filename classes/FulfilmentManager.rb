# FulfilmentManager for the NOMSS.
#
# Responsible for all order fulfilment functions.
# Release History:
# 27/06/19 DMG

require_relative 'DataStore.rb'

class FulfilmentManager

  attr_accessor :products, :orders

  def initialize
    # Retrieve the one and only data source
    @semaphore = DataStore.instance.semaphore
  end

  # Attempt to fulfill list of requested orders
  #
  # Orders that can be fulfilled are executed.
  # An map of OrderIds which could not be fulfilled is returned - this may
  # be empty if all orders had been fulfilled.
  #
  def fulfillOrders(orderRequest)

    unfulfillable = Array.new
    orders = orderRequest['orderIds']

    # Design decision to synchronize for each order within this request.
    # This should give other threads (other user/session requests) the
    # opportunity to execute their orders concurrently at the order level
    orders.each do |orderId|
      @semaphore.synchronize do
        # For each order (Synchronized block)
        # => Lookup order details
        #   => If Status Not 'Pending' - flag warning - fail this order 'unfillable'
        #   => Confirm all order products are fillable, if quantity is not available - fail this order 'unfillable'
        #   => Fill the order (Update order status, update inventory, re-order stock if needed)
        order = getOrder(orderId)
        if orderFillable?(order)
          fillOrder(order)
        else
          unfulfillable << order.orderId
          order.setStatusError
        end
        # Always run stock level check
        checkInventory
      end #Synchronize
    end
    {"unfulfillable" => unfulfillable}
  end

  # Return all products
  def getProducts
    DataStore.instance.products
  end

  # Return all Orders
  def getOrders
    DataStore.instance.orders
  end

  # Return order by Id
  def getOrder(orderId)
    DataStore.instance.getOrder(orderId)
  end

  # Return all purchase orders
  def getPurchaseOrders
    DataStore.instance.purchaseOrders
  end

  # Validate that the entire order is fillable
  def orderFillable?(order)
    fillable = true

    if order.status != Order::PENDING
      # Only Pending orders can be filled
      fillable = false
    elsif !itemsFillable?(order.items)
      # Verify all order items are Fillable
      fillable = false
    end
    fillable
  end

  # Validate that an orders items are fillable
  def itemsFillable?(items)
    fillable = true

    items.each do |itm|
      product = DataStore.instance.getProduct(itm.productId)
      if product.quantityOnHand < itm.quantity
        fillable = false
        break
      end
    end
    fillable
  end

  # Fill a validated order
  def fillOrder(order)
    order.items.each do |itm|
      product = DataStore.instance.getProduct(itm.productId)
      if product.quantityOnHand < itm.quantity
        # Cant happen on validated order ! throw exception
        raise Exception.new "System Error: Order #{order.orderId} Insufficient stock."
      else
        product.decrementQuantityOnHand(itm.quantity)
      end
    end
    order.setStatusFulfilled
  end

  # Do an inventory check and raise Purchase Orders if needed
  def checkInventory
    # Check if purchase order needed. Do not restock if there are
    # preexisting purchase orders for a product
    products = DataStore.instance.products
    products.each do |prod|
      if prod.quantityOnHand < prod.reorderThreshold
        # reorder
        DataStore.instance.createPurchaseOrder(prod.productId, prod.reorderAmount)
      end
    end
  end

end
