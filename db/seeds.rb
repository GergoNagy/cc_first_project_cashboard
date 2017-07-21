require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')

# Transaction.delete_all()
Tag.delete_all()
# Merchant.delete_all()

tag1 = Tag.new({
  'type' => 'food'
  })

tag1.save