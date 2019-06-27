# Product Unit test - WIP
#
require_relative '../classes/Product.rb'

# Test Cases in progress
describe '#updateQuantityOnHand' do
  it "should do something sensible" do
    prod = Product.new(nil,nil,nil,nil,nil,nil)
    expect(prod.updateQuantityOnHand).to eq(nil)
  end
end
