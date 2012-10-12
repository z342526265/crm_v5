class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|

      t.string :name
      #t.text :permission
      t.text :description
      t.column :cate,:integer ,:default=>0
      t.integer :protect_client_count,:default=>0  #当前角色对应的保护客户数量

      t.integer :created_user_id #创建人

      t.timestamps
    end

    add_index :roles,:name
    add_index :roles,:cate
    add_index :roles,:protect_client_count

  end
end
