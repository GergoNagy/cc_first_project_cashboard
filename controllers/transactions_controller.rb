require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

get '/transactions' do
  @transactions = Transaction.all()
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb(:"transactions/index")
end

get '/transactions/new' do
  @transactions = Transaction.all
  @tags = Tag.all
  @merchants = Merchant.all
  erb(:"transactions/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to ("/transactions")
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @tags = Tag.all
  @merchants = Merchant.all
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  Transaction.new(params).update
  redirect to ("transactions")
end

post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to ("/transactions")
end








