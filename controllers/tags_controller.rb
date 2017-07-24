require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

get '/tags/:id' do
  @tags = Transaction.total_amount_by_tag(params[:id])
  erb(:"tags/index")
end