# Sinatra router for the NOMSS API.
#
# Responsible for routing all fulfilment API requests.
# Release History:
# 27/06/19 DMG

require 'sinatra'
require 'json'
require_relative 'classes/FulfilmentManager.rb'

# Dir[settings.root + "/classes/*.rb"].each {|file| require file}

get '/api/v1/warehouse/product' do
  apiMgr = FulfilmentManager.new

  response = DataStore.instance.products[0].to_json
end

# TODO Need API for unfillable orders
get '/api/v1/warehouse/order' do
  apiMgr = FulfilmentManager.new

  response = DataStore.instance.products[0].to_json
end

get '/api/v1/warehouse/purchaseOrder' do
  apiMgr = FulfilmentManager.new

  response = DataStore.instance.products[0].to_json
end

post '/api/v1/warehouse/fulfilment' do
  apiMgr = FulfilmentManager.new

end
