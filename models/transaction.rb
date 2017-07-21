require_relative( '../db/sql_runner' )

class Transaction

  class initialize( options )
    @id = options['id'].to_i
    @value = options['value'].to_f
    @trans_date = options['trans_date']
    @tag_id = options['tag_id']to_i
    merchant_id = options['merchant_id']to_i
  end


end