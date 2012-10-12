class CreateTablePermissionsRoles < ActiveRecord::Migration
  def change
    create_table :permissions_roles,:id=>false,:force => true do |t|
      t.integer :role_id #用户id
      t.integer :permission_id #类型id

      #t.timestamps
    end

    add_index :permissions_roles,:role_id
    add_index :permissions_roles,:permission_id
  end
end
