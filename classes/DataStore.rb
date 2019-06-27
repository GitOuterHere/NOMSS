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

  # TODO: Although reader, should return deep copies instead?
  attr_reader :products, :orders, :purchaseOrders, :semaphore

  # Singleton constructor. Reads the data file representing a starting
  # point snapshot for this data source. Parses the JSON content to
  # object representations
  def initialize
    # Single semaphore for use in critical sections
    @semaphore = Mutex.new

    # Read/parse immutable starting point file
    file = open("resources/data.json")
    json = file.read
    file.close

    # TODO : Add Limit for parse depth
    parsed = JSON.parse(json)
    @products = parsed['products']
    @products.map { |prod| Product.new(prod['productId'],
      prod['description'], prod['quantityOnHand'], prod['reorderThreshold'],
      prod['reorderAmount'], prod['deliveryLeadTime']) }
    @orders = parsed['orders']
    @orders.map { |ord| Order.new(ord['orderId'],
      ord['status'], ord['dateCreated'], ord['items']) }
  end

  # TODO: Implement json load and accessors for products and orders
  def testMe
    return "hello"
  end

end
