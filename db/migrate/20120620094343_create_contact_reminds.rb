class CreateContactReminds < ActiveRecord::Migration
  def change
    create_table :contact_reminds do |t|

      t.string :name
      t.datetime :remind_datetime
      t.text :remind_content
      t.integer :user_id
      t.integer :mini_client_id
      t.boolean :is_reminded ,:default=>false

      t.integer :created_user_id

      t.timestamps
    end

    add_index :contact_reminds,:is_reminded
    add_index :contact_reminds,:user_id
    add_index :contact_reminds,:mini_client_id


  end
end
