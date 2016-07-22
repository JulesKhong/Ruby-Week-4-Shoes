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

post('/brand/add') do
  name = params.fetch('brand_name')
  brand = Brand.new({:name => name })
  brand.save
  redirect to("/")
end

get('/store/:id') do
  id = params.fetch('id')
  @store = Store.find(id)
  @brands = @store.brands
  @all_brands = Brand.all
  erb(:store)
end

patch('/store/:id') do
  brand_id = params.fetch('brand_add').to_i
  brand = Brand.find(brand_id)
  store_id = params.fetch('store_id').to_i
  @store = Store.find(store_id)
  @store.brands.push(brand)
  redirect to("/store/#{@store.id}")
end
