# Product for the NOMSS.
#
# Responsible for fulfilment product functions.
# Release History:
# 27/06/19 DMG

class Product
  attr_reader :productId, :description, :quantityOnHand, :reorderThreshold, :reorderAmount, :deliveryLeadTime

  def initialize(productId, description, quantityOnHand, reorderThreshold, reorderAmount, deliveryLeadTime)
      @productId = productId
      @description = description
      @quantityOnHand = quantityOnHand
      @reorderThreshold = reorderThreshold
      @reorderAmount = reorderAmount
      @deliveryLeadTime = deliveryLeadTime
  end

  # TODO: Implement
  def updateQuantityOnHand

  end

end
