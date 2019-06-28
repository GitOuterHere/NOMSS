# FulfilmentManager Unit test
#
require_relative '../classes/FulfilmentManager.rb'

describe '#getProducts' do
  it "should return valid baseline products" do
    fm = FulfilmentManager.new
    expect(fm.getProducts.length).to eq(3)
  end
end

describe '#getOrders' do
  it "should return valid baseline orders" do
    fm = FulfilmentManager.new
    expect(fm.getOrders.length).to eq(4)
  end
end

describe '#orderFillable?' do
  it "should be fillable" do
    fm = FulfilmentManager.new
    order = fm.getOrder(1122)
    expect(fm.orderFillable?(order)).to be_truthy
  end
end

describe '#orderFillable?' do
  it "should not be fillable" do
    fm = FulfilmentManager.new
    order = fm.getOrder(1122)
    order.setStatusFulfilled
    expect(fm.orderFillable?(order)).to be_falsey
  end
end

describe '#orderFillable?' do
  it "should not be fillable" do
    fm = FulfilmentManager.new
    order = fm.getOrder(1122)
    order.items[1] = Item.new(1122, 2, 10000, 1.23)
    expect(fm.orderFillable?(order)).to be_falsey
  end
end

describe '#checkInventory' do
  it "should generate 1 PO" do
    fm = FulfilmentManager.new
    fm.checkInventory()
    expect(fm.getPurchaseOrders.length).to eq(1)
  end
end
