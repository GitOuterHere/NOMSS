# FulfilmentManager for the NOMSS.
#
# Responsible for all order fulfilment functions.
# Release History:
# 27/06/19 DMG

require_relative 'DataStore.rb'

class FulfilmentManager

  attr_accessor :products, :orders

  def initialize
    # Retrieve the one and only for later unit of work operations
    @semaphore = DataStore.instance.semaphore
  end

  # TODO: Implement
  def fulfilOrders(orderIds)

    unfillable = Array.new

    orderIds.each do |orderId|
      puts "The current item + 2 is #{orderId}."
      @semaphore.synchronize do
        # For each order (Synchronized block)
        # => Lookup order details
        #   => If Status Not 'Pending' - flag warning (?) - fail this order 'unfillable'
        #   => Confirm all order products are fillable, if quantity is not available - fail this order 'unfillable'
        #   => Fill the order (Update order status, update inventory, re-order stock if needed)
        order = Self.getOrder(orderId)

      end
    end
  end

  # TODO: Implement
  def getProducts

  end

  # TODO: Implement
  def getOrders

  end

  # TODO: Implement
  def getOrder(orderId)

  end
  # TODO: Implement
  def getPurchaseOrders

  end

protected
  # TODO: Implement
  def updateStockQuantity

  end

  # TODO: Implement
  def createPurchaseOrder

  end

  # TODO: Implement
  def updateOrderStatus

  end
end
