require('spec_helper')

describe(Store) do
  it "validates the presence of a store name" do
    store = Store.new({:name => "", :location => "Portland, OR"})
    expect(store.save).to(eq(false))
  end
  it "allows a user to type a maximum of 20 characters for a store name" do
    store = Store.new({:name => "a".*(21), :location => "Vancouver, BC"})
    expect(store.save).to(eq(false))
  end

  it "capitalizes a name" do
    store = Store.create({:name => "oddball"})
    expect(store.name).to(eq("Oddball"))
  end
end
