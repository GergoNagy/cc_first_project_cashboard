require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/tag')

get '/tags/new' do
  @tags = Tag.all
  erb(:"tags/new")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect to ("/transactions")
end

get '/tags/:id' do
  @transactions_by_tag = Transaction.amount_by_tag(params[:id])
  @amount_by_tag = Transaction.total_amount_by_tag(params[:id])
  erb(:"tags/index")
end




