class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :asset_id,:null=>false
      t.integer :user_id      #使用人
      t.date :used_date   #使用日期
      t.date :purchase_date   #采购日期
      t.column :count,:decimal  #数量
      t.column :price,:decimal  #单价
      t.column :purchase_price,:integer  #采购单价
      t.column :purchase_count,:decimal  #采购数量
      t.column :supplier_id,:integer #供应商
      t.column :purchase_user_id,:integer #采购人
      t.column :purchase_way_id,:integer #采购方式
      t.column :description,:text  #备注

      t.column :used_count,:decimal,:default=>0  #已领用数量
      t.column :used_date,:date,:default=>Date.today  #领用日期
      t.column :remained_count,:decimal  #剩余数量
      t.column :parent_id,:integer   #属于哪个采购订单


      t.timestamps
    end
    add_index :stocks,:asset_id
    add_index :stocks,:user_id
    add_index :stocks,:used_date
    add_index :stocks,:purchase_date
    add_index :stocks,:supplier_id
    add_index :stocks,:purchase_user_id
    add_index :stocks,:parent_id

  end
end
