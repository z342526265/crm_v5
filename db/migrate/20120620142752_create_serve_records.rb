class CreateServeRecords < ActiveRecord::Migration
  def change
    create_table :serve_records do |t|
      t.integer :order_id
      t.integer :mini_client_id
      t.integer :created_user_id
      t.text :content
      t.integer :contact_person_id  #联系人id
      t.integer :contact_way_id  #联系方式
      t.integer :contact_result_id #联系结果

      t.timestamps
    end
    add_column :serve_records,:invalid_contact_description,:string

    add_index :serve_records,:order_id
    add_index :serve_records,:mini_client_id
    add_index :serve_records,:created_user_id
  end
end
