class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|

      t.integer :asset_cate_id #资产类型

      t.string :name,:null=>false #资产名称

      t.string :number,:null=>false #资产编号

      t.integer :user_id #资产所属人

      t.string :brand #品牌

      t.string :standard #规格

      t.integer :supplier_id #供应商

      t.date :purchase_date #采购日期

      t.decimal :purchase_price #采购价格

      t.integer :purchase_user_id #采购人

      t.integer :purchase_way_id #采购方式

      t.text :description #备注

      t.timestamps
    end

    add_index :assets,:asset_cate_id
    add_index :assets,:number
    add_index :assets,:name
    add_index :assets,:user_id
    add_index :assets,:supplier_id

  end
end
