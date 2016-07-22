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
