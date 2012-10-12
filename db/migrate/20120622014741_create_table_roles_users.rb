class CreateTableRolesUsers < ActiveRecord::Migration
  def change
    create_table :roles_users,:id=>false,:force => true do |t|
      t.integer :role_id #用户id
      t.integer :user_id #类型id

      #t.timestamps
    end

    add_index :roles_users,:role_id
    add_index :roles_users,:user_id
  end
end
