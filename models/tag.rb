require('pry-byebug')
require_relative('../db/sql_runner')
require_relative( '../db/sql_runner' )
require_relative( './merchant' )

class Tag

  attr_accessor :type
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
  end

  def save
    sql = "INSERT INTO tags (type) VALUES ('#{@type}')
           RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tags;"
    SqlRunner.run(sql).map {|tag| Tag.new(tag)}
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id =#{id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM tags;"
    SqlRunner.run(sql)
  end
 


end