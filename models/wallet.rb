require('pry-byebug')
require_relative( '../db/sql_runner' )
require_relative( './tag' )
require_relative( './merchant' )
require_relative( './transaction' )

class Wallet

  def initialize(options)
    @id = options['id'].to_i
    @budget = options['budget']to_i
  end

  def save
    sql = "INSERT INTO wallets (budget) = (#{budget})
      RETURNUNG id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def update
    sql = "UPDATE wallets SET (budget) = (#{budget})
      WHERE id;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM wallets WHERE id = #{id}"
    Wallet.new(SqlRunner.run(sql)[0])
  end


end
