# Order for the NOMSS.
#
# Responsible for fulfilment order functions.
# Release History:
# 27/06/19 DMG

require 'json'
require_relative 'Item.rb'

class Order
  attr_reader :orderId, :status, :dateCreated, :items

  # TODO Implement enum for order Status

  def initialize(orderId, status, dateCreated, items)
      @orderId = orderId
      @status = status
      @dateCreated = dateCreated
      self.parseItems(items)
  end

  # TODO: Implement
  def updateOrderStatus(orderId, orderStatus)

  end

  # TODO: Implement
  def getOrder(orderId)

  end
# protected

  # Convert JSON array to array of objects
  #
  # Note I wanted to make this protected but then would have to do funky things
  # to unit test it (like using "send" ?)
  def parseItems(arrItems)
    arrItems.each do |itm|
      @items = Array.new
      @items << Item.new(itm['orderId'],
      itm['productId'], itm['quantity'], itm['costPerItem'])
    end
  end
end
