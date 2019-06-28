# PurchaseOrder for the NOMSS.
#
# Responsible for fulfilment purchase order functions.
# Release History:
# 27/06/19 DMG

class PurchaseOrder
  attr_reader :dateCreated, :productId, :quantity

  def initialize(dateCreated, productId, quantity)
      @dateCreated = dateCreated
      @productId = productId
      @quantity = quantity
  end

  # This ideally should be provided by a framework or mapping layer
  def to_json(options={})
      {'dateCreated' => @dateCreated,
       'productId' => @productId,
       'quantity' => @quantity}.to_json
  end

end
