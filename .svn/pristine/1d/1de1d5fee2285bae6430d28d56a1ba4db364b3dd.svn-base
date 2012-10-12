class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :number
      t.text :description
      t.integer :category_id

      t.integer :cate  #产品大类  0=>产品，1=>服务

      t.timestamps
    end

    add_index :products,:category_id
    add_index :products,:cate
    add_index :products,:number
    add_index :products,:name

  end
end
