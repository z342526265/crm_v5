class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :server_length

      t.integer :created_user_id

      t.date :serve_start_at,:default=>Time.now
      t.date :serve_end_at,:null=>false

      t.decimal :contract_amount,:default=>0,:precision => 8, :scale => 2
      t.decimal :received_amount,:default=>0 ,:precision => 8, :scale => 2
      t.decimal :owe_amount,:default=>0 ,:precision => 8, :scale => 2


      t.timestamps
    end


    add_index :order_items,:serve_end_at
    add_index :order_items,:serve_start_at

    add_index :order_items,:order_id
    add_index :order_items,:product_id

  end
end