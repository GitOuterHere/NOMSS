# Order for the NOMSS.
#
# Responsible for fulfilment order functions.
# Release History:
# 27/06/19 DMG

require 'json'
require_relative 'Item.rb'

class Order
  attr_reader :orderId, :status, :dateCreated, :items

  # Status Constants - TODO: Investigate include Enumerable
  PENDING = 'Pending'
  FULFILLED = 'Fulfilled'

  # TODO Implement enum for order Status

  def initialize(orderId, status, dateCreated, items)
      @orderId = orderId
      @status = status
      @dateCreated = dateCreated
      self.parseItems(items)
  end

  # This really should be provided by a framework somewhere.... <sigh>
  def to_json(options={})

    {'orderId' => @orderId,
     'status' => @status,
     'dateCreated' => @dateCreated,
     'items' => @items}.to_json

  end

  # Updates the Order status of this order to fulfilled
  def setStatusFulfilled
    @status = Order::FULFILLED
  end

# protected

  # Convert JSON array to array of objects
  #
  # Note I wanted to make this protected but then would have to do funky things
  # to unit test it (like using "send" ?)
  def parseItems(arrItems)
    @items = arrItems.map { |item| Item.new(item['orderId'],
    item['productId'], item['quantity'], item['costPerItem']) }
    #arrItems.each do |itm|
    #  @items = Array.new
    #  @items << Item.new(itm['orderId'],
    #  itm['productId'], itm['quantity'], itm['costPerItem'])
    #end
  end
end
