# PurchaseOrder Unit test - WIP
#
require_relative '../classes/PurchaseOrder.rb'

# Test Cases in progress
describe '#testMe' do
  it "should do something sensible" do
    pord = PurchaseOrder.new(nil,nil,nil,nil)
    expect(pord.testMe).to eq(nil)
  end
end
