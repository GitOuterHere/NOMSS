# PurchaseOrder Unit test
#
require_relative '../classes/PurchaseOrder.rb'

# For future use
describe '#placeholder' do
  it "should do something sensible" do
    pord = PurchaseOrder.new(nil,nil,nil)
    expect(true).to be_truthy
  end
end
