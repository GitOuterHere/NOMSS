# PurchaseOrder Unit test
#
require_relative '../classes/PurchaseOrder.rb'

# For future use
describe '#testMe' do
  it "should do something sensible" do
    pord = PurchaseOrder.new(nil,nil,nil,nil)
    expect(pord.testMe).to eq(nil)
  end
end
