class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|

      t.string :name                #部门名称
      t.integer :parent_id
      t.integer :cate
      t.integer :manager_id         #部门负责人
      t.text :description           #部门描述
      t.column :users_count,:integer,:default=>0   #部门员工数量
      t.integer :created_user_id #创建人

      t.timestamps
    end

    add_index :departments, :manager_id
    add_index :departments, :parent_id
  end
end
