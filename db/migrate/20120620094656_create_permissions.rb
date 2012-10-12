class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|

      t.column :name,:string
      t.column :c_actions,:text
      t.column :description,:text
      t.column :cate,:integer
      t.column :created_user_id,:integer  #创建人
      t.timestamps
    end
  end
end
