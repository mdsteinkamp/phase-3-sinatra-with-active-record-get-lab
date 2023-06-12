class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do 
    bakery = Bakery.all
    bakery.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(:price).reverse
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    priciest_pastry = BakedGood.all.order(:price).last
    priciest_pastry.to_json
  end

end
