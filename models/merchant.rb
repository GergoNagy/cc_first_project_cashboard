require_relative('../db/sql_runner')

class Merchant

  attr_reader :id
  
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @icon = options['icon']
  end

  def save
    sql = "INSERT INTO merchants (name, icon) VALUES ('#{@name}', '#{@icon}') RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM merchants;"
    SqlRunner.run(sql).map {|merchant| Merchant.new(merchant)}
  end

  def self.delete_all
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end


end