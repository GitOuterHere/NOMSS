# DataSource Unit test
#
require_relative '../classes/DataStore.rb'

# Valid test cases follow
describe 'singleton' do
  it "always returns the same instance" do
    ds1 = DataStore.instance
    ds2 = DataStore.instance
    expect(ds1.object_id).to eq(ds2.object_id)
  end
end

describe '#getOrder(id)' do
  it "should return an existing order" do
    ds1 = DataStore.instance
    expect(ds1.getOrder(1122).orderId).to eq(1122)
  end
end

describe '#getOrder(id)' do
  it "should return nil for unknown order" do
    ds1 = DataStore.instance
    expect(ds1.getOrder(3333)).to be_nil
  end
end

describe '#getProduct(id)' do
  it "should return an existing product" do
    ds1 = DataStore.instance
    expect(ds1.getProduct(1).productId).to eq(1)
  end
end

describe '#getProduct(id)' do
  it "should return nil for unknown product" do
    ds1 = DataStore.instance
    expect(ds1.getProduct(33)).to be_nil
  end
end

describe '#createPurchaseOrder(id, amount)' do
  it "should create a PO if one does not exist" do
    ds = DataStore.instance
    expect(ds.createPurchaseOrder(1, 100)).to be_truthy
  end
end

describe '#createPurchaseOrder(id, amount)' do
  it "should not create a PO is one already exists" do
    ds = DataStore.instance
    expect(ds.createPurchaseOrder(1, 100)).to be_falsey
  end
end
