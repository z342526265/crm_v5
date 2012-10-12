class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :cate
      t.integer :level,:default=>0
      t.boolean :need_verify,:default=>false
      t.text :description
      t.integer :num  #数值
      t.integer :department_id   #所属部门
      t.integer :created_user_id

      t.timestamps
    end
    add_index :categories, :name
    add_index :categories, :cate
    add_index :categories, :level
    add_index :categories, :need_verify

  end
end
