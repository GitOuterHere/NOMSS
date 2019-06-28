# Order Unit test
#
require_relative '../classes/Order.rb'

# For future use
describe '#updateOrderStatus' do
  it "should do something sensible" do
    ord = Order.new(nil,nil,nil,[])
    expect(ord.updateOrderStatus).to eq(nil)
  end
end
