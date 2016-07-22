require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

post('/store/add') do
  name = params.fetch('store_name')
  location = params.fetch('store_location')
  store = Store.new({:name => name, :location => location})
  store.save
  redirect to("/")
end
