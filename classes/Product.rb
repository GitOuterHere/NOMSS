# Product for the NOMSS.
#
# Responsible for fulfilment product functions.
# Release History:
# 27/06/19 DMG

require 'json'

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

  # This really should be provided by a framework somewhere.... <sigh>
  def to_json(options={})
      {'productId' => @productId,
       'description' => @description,
       'quantityOnHand' => @quantityOnHand,
       'reorderThreshold' => @reorderThreshold,
       'reorderAmount' => @reorderAmount,
       'deliveryLeadTime' => @deliveryLeadTime}.to_json
  end

  # Decrements the quantity on hand by the given amount
  def decrementQuantityOnHand(amount)
    @quantityOnHand -= amount
  end

end
