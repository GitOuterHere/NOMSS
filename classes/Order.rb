# Order for the NOMSS.
#
# Responsible for fulfilment order functions.
# Release History:
# 27/06/19 DMG

require 'json'
require_relative 'Item.rb'

class Order
  attr_reader :orderId, :status, :dateCreated, :items

  # Status Constants
  PENDING = 'Pending'
  FULFILLED = 'Fulfilled'
  ERROR = 'Error: Unfulfillable'

  def initialize(orderId, status, dateCreated, items)
      @orderId = orderId
      @status = status
      @dateCreated = dateCreated
      self.parseItems(items)
  end

  # This ideally should be provided by a framework or mapping layer
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

  # Updates the Order status of this order to Error: Unfulfillable
  def setStatusError
    @status = Order::ERROR
  end

  # Convert JSON array to array of objects
  def parseItems(arrItems)
    if arrItems
      @items = arrItems.map { |item| Item.new(item['orderId'],
      item['productId'], item['quantity'], item['costPerItem']) }
    end
  end
end
