class CreateContactRecords < ActiveRecord::Migration
  def change
    create_table :contact_records do |t|
      t.date :contact_date    #联系日期
      t.string :contact_person  #联系人
      t.integer :contact_person_id  #联系人id
      t.integer :contact_way_id  #联系方式
      t.integer :mini_client_id   #所属客户
      t.integer :user_id    #联系人
      t.integer :contact_result_id #联系结果
      t.boolean :is_move_to_public_store  #是否踢入公海

      t.string :introduce_product  #介绍的产品
      t.string :introduce_server #介绍的服务
      t.string :interest_point #兴趣点
      t.string :dissent_point #异议点

      t.string :invalid_contact_description #无效联系的记录

      t.string :description #备注
      t.string :follow_ideas #跟进思路

      t.integer :created_user_id #创建人id

      t.timestamps
    end

    add_index :contact_records, :contact_person_id
    add_index :contact_records, :contact_way_id
    add_index :contact_records, :mini_client_id
    add_index :contact_records, :user_id
    add_index :contact_records, :contact_result_id
    add_index :contact_records, :created_user_id

  end
end
