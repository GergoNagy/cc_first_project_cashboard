require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()

tag1 = Tag.new({'type' => 'food'})
tag2 = Tag.new({'type' => 'cloats'})
tag3 = Tag.new({'type' => 'IT stuff'})
tag4 = Tag.new({'type' => 'rent'})

tag1.save
tag2.save
tag3.save
tag4.save

merchant1 = Merchant.new({
    'name' => 'Lidl',
    'icon' => '../public/images/lidl.png'})
merchant2 = Merchant.new({
    'name' => 'Pc World',
    'icon' => '../public/images/pcworld.jpg'})
merchant3 = Merchant.new({
    'name' => 'Amazon', 
    'icon' => '../public/images/amazon.png'})

merchant1.save
merchant2.save
merchant3.save

transaction1 = Transaction.new({
    'value' => 12, 
    'trans_date' => 'Jan-12-2017',
    'tag_id' => tag1.id, 
    'merchant_id' => merchant1.id})
transaction2 = Transaction.new({
    'value' => 1200,
    'trans_date' => 'Jan-05-2017', 
    'tag_id' => tag3.id, 
    'merchant_id' => merchant2.id})
transaction3 = Transaction.new({
    'value' => 200,
    'trans_date' => 'Feb-12-2017', 
    'tag_id' => tag2.id, 
    'merchant_id' => merchant3.id})

transaction1.save
transaction2.save
transaction3.save



