require('pry-byebug')
require_relative( '../db/sql_runner' )
require_relative( './tag' )
require_relative( './merchant' )



class Transaction

  attr_accessor :trans_date, :value, :tag_id, :merchant_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @value = options['value']
    @trans_date = options['trans_date']
    @tag_id = options['tag_id'].to_i
    @merchant_id = options['merchant_id'].to_i
  end

  def save
    sql = "INSERT INTO transactions (value, trans_date, tag_id, merchant_id) VALUES (#{@value}, '#{@trans_date}', '#{@tag_id}', '#{@merchant_id}') RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

   def merchant
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id}"
    Merchant.new(SqlRunner.run(sql)[0])
  end

  def tag
    sql = "SELECT * FROM tags WHERE id = #{@tag_id}"
    Tag.new(SqlRunner.run(sql)[0])
  end

  def self.all
    sql = "SELECT * FROM transactions;"
    SqlRunner.run(sql).map {|transaction| Transaction.new(transaction)}
  end

  def self.delete_all
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def self.total_amount
    sql = "SELECT SUM(value) FROM transactions;"
    SqlRunner.run(sql)[0]
  end

  def self.total_amount_by_tag(id)
    sql = "SELECT transactions.*, tags.type FROM transactions
           INNER JOIN tags ON tags.id = tag_id
           WHERE transactions.tag_id = id;"
    SqlRunner.run(sql).map{|amount| Transaction.new(amount)}
  end
  
  

end