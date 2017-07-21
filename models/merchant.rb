require_relative('../db/sql_runner')

class Merchant

  class initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @icon = options['icon']
  end

  
end