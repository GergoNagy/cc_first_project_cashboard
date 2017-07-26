require('pry-byebug')
require_relative( '../db/sql_runner' )
require_relative( './tag' )
require_relative( './merchant' )
require_relative( './transaction' )

class Wallet

  attr_accessor :budget
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @budget = options['budget'].to_i
  end

  def save
    sql = "INSERT INTO wallets (budget) VALUES (#{@budget})
      RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def update
    sql = "UPDATE wallets SET (budget) = (#{@budget})"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM wallets WHERE id = #{id}"
    Wallet.new(SqlRunner.run(sql)[0])
  end

  def self.delete_all
    sql = "DELETE FROM wallets;"
    SqlRunner.run(sql)
  end

  def self.budget
    sql = "SELECT budget FROM wallets;"
    SqlRunner.run(sql)[0]
  end

  def self.new_budget
    budget = Wallet.budget.first[1].to_i
    amount = Transaction.total_amount.first[1].to_i
    result = budget -= amount
  end



end
