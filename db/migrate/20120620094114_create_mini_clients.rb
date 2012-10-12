class CreateMiniClients < ActiveRecord::Migration
  def change
    create_table :mini_clients do |t|

      t.integer :client_id  #客户id
      t.integer :public_store_id  #公海id
      t.integer :user_id  #用户id
      t.integer :share_user_id  #共享用户id

      t.integer :status_num,:default=>0,:limit=>2

      t.integer :serve_user1_id
      t.integer :serve_user2_id

      t.datetime :due_time  #到期时间

      t.integer :orders_count

      t.integer :created_user_id
      t.timestamps
    end


    add_index :mini_clients,:orders_count
    add_index :mini_clients,:serve_user1_id
    add_index :mini_clients,:serve_user2_id
    add_index :mini_clients,:client_id
    add_index :mini_clients,:public_store_id
    add_index :mini_clients,:user_id
    add_index :mini_clients,:share_user_id
    add_index :mini_clients,:status_num
    add_index :mini_clients,:created_user_id

  end
end
