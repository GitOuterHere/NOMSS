# Order Item for the NOMSS.
#
# Responsible for fulfilment item functions.
# Release History:
# 27/06/19 DMG

require 'json'

class Item
  attr_reader :orderId, :productId, :quantity, :costPerItem

  def initialize(orderId, productId, quantity, costPerItem)
      @orderId = orderId
      @productId = productId
      @quantity = quantity
      @costPerItem = costPerItem
  end

  # This ideally should be provided by a framework or mapping layer
  def to_json(options={})

      {'orderId' => @orderId,
       'productId' => @productId,
       'quantity' => @quantity,
       'costPerItem' => @costPerItem}.to_json
  end

end
