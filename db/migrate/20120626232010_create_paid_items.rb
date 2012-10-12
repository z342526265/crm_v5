class CreatePaidItems < ActiveRecord::Migration
  def change
    create_table :paid_items do |t|
      t.integer :order_id
      t.integer :order_item_id
      t.decimal :received_amount,:default=>0.0,:null=>false
      t.integer :created_user_id

      t.timestamps
    end
    add_index :paid_items,:order_item_id
    add_index :paid_items,:order_id
    add_index :paid_items,:created_user_id
  end
end
