class CreateTablePublicStoresUsers < ActiveRecord::Migration
  def change
    create_table :public_stores_users,:id=>false,:force => true do |t|

      t.integer :public_store_id #
      t.integer :user_id #

      #t.timestamps
    end

    add_index :public_stores_users,:public_store_id
    add_index :public_stores_users,:user_id
  end
end
