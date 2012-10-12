class CreateTableCheckItemsUsers < ActiveRecord::Migration
  create_table :check_items_users,:id=>false,:force => true do |t|
    t.integer :check_item_id #用户id
    t.integer :user_id #类型id

    #t.timestamps
  end

  add_index :check_items_users,:check_item_id
  add_index :check_items_users,:user_id
end
