require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a brand', {:type => :feature}) do
  it "allows a user to add a brand" do
    visit('/')
    fill_in('brand_name', :with => "Saucony")
    click_button('Add store')
    expect(page).to have_content('Saucony')
  end
end
