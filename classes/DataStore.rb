# DataStore for the NOMSS.
#
# Responsible for storage management of fulfilment data.
# Release History:
# 27/06/19 DMG

require 'singleton'
require 'json'
require_relative 'Product.rb'
require_relative 'Order.rb'
require_relative 'PurchaseOrder.rb'

class DataStore
  include Singleton

  attr_reader :products, :orders, :purchaseOrders, :semaphore

  # Singleton constructor. Reads the data file representing a starting
  # point snapshot for this data source. Parses the file JSON content to
  # object representations
  def initialize
    # Single semaphore for use in critical sections
    @semaphore = Mutex.new

    # Read/parse immutable starting point file
    file = open("resources/data.json")
    json = file.read
    file.close

    # Parse content
    parsed = JSON.parse(json)
    @products = parsed['products']
    if @products
      @products.map! { |prod| Product.new(prod['productId'],
        prod['description'], prod['quantityOnHand'], prod['reorderThreshold'],
        prod['reorderAmount'], prod['deliveryLeadTime']) }
    end
    @orders = parsed['orders']
    if @orders
      @orders.map! { |ord| Order.new(ord['orderId'],
        ord['status'], ord['dateCreated'], ord['items']) }
    end
    @purchaseOrders = Array.new
  end

  # Get an Order by Id
  # Returns nil if order is not found
  def getOrder(id)
    @orders.find {|ord| ord.orderId.to_i == id.to_i}
  end

  # Get a Product by Id
  # Returns nil if product is not found
  def getProduct(id)
    @products.find {|prod| prod.productId.to_i == id.to_i}
  end

  # Create a new purchase order.
  #
  # Returns True if a new PO was created and False otherwise (if a PO already
  # exists).
  def createPurchaseOrder(productId, orderAmount)
    created = false
    existingOrder = @purchaseOrders.find {|ord| ord.productId.to_i == productId.to_i}
    if existingOrder == nil
      @purchaseOrders << PurchaseOrder.new(Time.now, productId, orderAmount)
      created = true
    end
    created
  end
end
