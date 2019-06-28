# Sinatra router for the NOMSS API.
#
# Responsible for routing all fulfilment API requests.
# Release History:
# 27/06/19 DMG

require 'sinatra'
require 'json'
require_relative 'classes/FulfilmentManager.rb'

# Fulfill a list of orders
post '/api/v1/warehouse/fulfilment' do
  FulfilmentManager.new.fulfillOrders(JSON.parse(request.body.read)).to_json
end

# Helper Operations follow

# GET all Products
get '/api/v1/warehouse/product' do
  FulfilmentManager.new.getProducts.to_json
end

# GET all orders
# TODO Need API for unfillable orders
get '/api/v1/warehouse/order' do
  FulfilmentManager.new.getOrders.to_json
end

# GET an order
get '/api/v1/warehouse/order/:orderId' do
  FulfilmentManager.new.getOrder(params['orderId']).to_json
end

# GET all Purchase Orders
get '/api/v1/warehouse/purchaseOrder' do
  FulfilmentManager.new.getPurchaseOrders.to_json
end
