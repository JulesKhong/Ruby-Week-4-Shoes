require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a brand', {:type => :feature}) do
  it "allows a user to add a brand" do
    visit('/')
    fill_in('brand_name', :with => "Saucony")
    click_button('Add brand')
    expect(page).to have_content('Saucony')
  end
end

describe('list all brands', {:type => :feature}) do
  it "lists all brands on file on the homepage" do
    visit('/')
    fill_in('brand_name', :with => 'Reebok')
    click_button('Add brand')
    expect(page).to have_content('Reebok')
  end
end

# UPDATE

# DELETE
