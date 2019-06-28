# Item Unit test
#
require_relative '../classes/Item.rb'

# For future use
describe '#testMe' do
  it "should do something sensible" do
    it = Item.new(nil,nil,nil,nil)
    expect(it.testMe).to eq(nil)
  end
end
