class CreateUpdateLogs < ActiveRecord::Migration
  def change
    create_table :update_logs do |t|
      t.integer :update_logs_resource_id
      t.string :update_logs_resource_type
      t.text :content
      t.integer :created_user_id

      t.timestamps
    end
    add_index :update_logs,:update_logs_resource_id
    add_index :update_logs,:update_logs_resource_type
    add_index :update_logs,:created_user_id
  end
end
