# Product Unit test
#
require_relative '../classes/Product.rb'

# For future use
describe '#updateQuantityOnHand' do
  it "should do something sensible" do
    prod = Product.new(nil,nil,nil,nil,nil,nil)
    expect(prod.updateQuantityOnHand).to eq(nil)
  end
end
