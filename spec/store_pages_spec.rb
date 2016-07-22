require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a store', {:type => :feature}) do
  it "allows a user to add a store" do
    visit('/')
    fill_in('store_name', :with => 'Oddball')
    fill_in('store_location', :with => 'Portland, OR')
    click_button('Add store')
    expect(page).to have_content('Oddball')
  end
end

describe('list all stores', {:type => :feature}) do
  it "lists all stores on the homepage" do
    store = Store.new({:name => 'Oddball', :location => "Portland, OR"})
    store.save
    store2 = Store.new({:name => 'Swift', :location => "Los Angelos, CA"})
    store2.save
    visit('/')
    expect(page).to have_content('Oddball')
    expect(page).to have_content('Swift')
  end
end
