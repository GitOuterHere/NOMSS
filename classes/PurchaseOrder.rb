# PurchaseOrder for the NOMSS.
#
# Responsible for fulfilment purchase order functions.
# Release History:
# 27/06/19 DMG

class PurchaseOrder
  attr_reader :orderId, :dateCreated, :productId, :quantity

  def initialize(orderId, dateCreated, productId, quantity)
      @orderId = orderId
      @dateCreated = dateCreated
      @productId = productId
      @quantity = quantity
  end

  def testMe

  end
end
