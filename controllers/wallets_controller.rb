require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/wallet')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')



set :wallet_id => 1

get '/wallets' do
  @wallet = Wallet.find(settings.wallet_id)
  erb (:"wallets/index")
end

post '/wallets/:id' do
  wallet = Wallet.find(params[:id])
  wallet.budget = params[:budget]
  wallet.update
  redirect to ("/")
end
