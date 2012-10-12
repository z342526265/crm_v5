class CreateRenewFees < ActiveRecord::Migration
  def change
    create_table :renew_fees do |t|
      t.integer :order_item_id   ,:null=>false
      t.decimal :fee_amount       ,:null=>false
      t.date :serve_end_at            ,:null=>false
      t.integer :created_user_id ,:null=>false

      t.timestamps
    end
  end
end
