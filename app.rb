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
  store = Store.create({:name => name, :location => location})
  redirect to("/")
end

post('/brand/add') do
  name = params.fetch('brand_name')
  brand = Brand.create({:name => name })
  redirect to("/")
end

get('/store/:id') do
  id = params.fetch('id')
  @store = Store.find(id)
  @brands = @store.brands
  @all_brands = Brand.all
  erb(:store)
end

patch('/store/:id/brand') do
  brand_id = params.fetch('brand_add').to_i
  brand = Brand.find(brand_id)
  store_id = params.fetch('store_id').to_i
  @store = Store.find(store_id)
  @store.brands.push(brand)
  redirect to("/store/#{@store.id}")
end

patch('/store/:id') do
  @store = Store.find(params.fetch('store_id').to_i)
  location = params.fetch('location_new')
  @store.update({:location => location})
  redirect to("/store/#{@store.id}")
end

patch('/store/:id/name') do
  @store = Store.find(params.fetch('store_id'))
  name = params.fetch('name_new')
  @store.update({:name => name})
  redirect to("/store/#{@store.id}")
end

delete('/store/:id/brand') do
  brand_id = params.fetch('brand_delete')
  brand = Brand.find(brand_id)
  @store = Store.find(params.fetch('store_id'))
  @store.brands.destroy(brand)
  redirect to("/store/#{@store.id}")
end

delete('/store/:id') do
  @store = Store.find(params.fetch('store_delete'))
  @store.destroy()
  redirect to('/')
end

delete('/brand/delete') do
  brand = Brand.find(params.fetch('brand_delete'))
  brand.destroy()
  redirect to('/')
end

get('/clear') do
  Store.all.each do |store|
    store.destroy
  end
  Brand.all.each do |brand|
    brand.destroy
  end
  redirect to("/")
end
