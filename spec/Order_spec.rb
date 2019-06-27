# Order Unit test - WIP
#
require_relative '../classes/Order.rb'

# Test Cases in progress
describe '#updateOrderStatus' do
  it "should do something sensible" do
    ord = Order.new(nil,nil,nil,[])
    expect(ord.updateOrderStatus).to eq(nil)
  end
end
