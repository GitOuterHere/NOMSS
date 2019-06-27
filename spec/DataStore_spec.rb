# DataSource Unit test - WIP
#
require_relative '../classes/DataStore.rb'

# Starting point experimentation
describe '#testMe' do
  it "always returns hello" do
    ds = DataStore.instance
    expect(ds.testMe).to eq("hello")
  end
end

# Valid test cases follow
describe 'singleton' do
  it "always returns the same instance" do
    ds1 = DataStore.instance
    ds2 = DataStore.instance
    expect(ds1.object_id).to eq(ds2.object_id)
  end
end
