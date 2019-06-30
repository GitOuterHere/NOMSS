# Order Unit test
#
require_relative '../classes/Order.rb'

# For future use
describe '#parseItems' do
  it "should create new objects" do
    items = [
      {
        "orderId": 1123,
        "productId": 1,
        "quantity": 4,
        "costPerItem": 10.45
      },
      {
        "orderId": 1123,
        "productId": 2,
        "quantity": 3,
        "costPerItem": 20.95
      },
      {
        "orderId": 1123,
        "productId": 3,
        "quantity": 5,
        "costPerItem": 20.95
      }
    ]
    ord = Order.new(1123,"Pending","2018-05-09 14:21",nil)
    ord.parseItems(items)
    expect(ord.items.length).to eq(3)
  end
end
