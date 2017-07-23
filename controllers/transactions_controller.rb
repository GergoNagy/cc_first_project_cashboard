require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

get '/transactions' do
  # binding.pry
  @transactions = Transaction.all()
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb(:"transactions/index")
end

get '/transaction/new' do
  @transactions = Transaction.new()
  erb(:"transactions/new")
end
