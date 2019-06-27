# Item for the NOMSS.
#
# Responsible for fulfilment item functions.
# Release History:
# 27/06/19 DMG


class Item
  attr_reader :orderId, :productId, :quantity, :costPerItem

  def initialize(orderId, productId, quantity, costPerItem)
      @orderId = orderId
      @productId = productId
      @quantity = quantity
      @costPerItem = costPerItem
  end

  def testMe

  end
end
