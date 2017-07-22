require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

get '/transactions' do
  # binding.pry
  @transactions = Transaction.all()
  erb(:"transactions/index")
end
