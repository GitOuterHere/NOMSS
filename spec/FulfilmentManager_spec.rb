# FulfilmentManager Unit test - WIP
#
require_relative '../classes/FulfilmentManager.rb'

# Test Cases in progress
describe '#getProducts' do
  it "should return valid baseline products" do
    fm = FulfilmentManager.new
    expect(fm.getProducts).to eq(nil)
  end
end
