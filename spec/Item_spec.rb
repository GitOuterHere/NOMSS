# Item Unit test - WIP
#
require_relative '../classes/Item.rb'

# Test Cases in progress
describe '#testMe' do
  it "should do something sensible" do
    it = Item.new(nil,nil,nil,nil)
    expect(it.testMe).to eq(nil)
  end
end
