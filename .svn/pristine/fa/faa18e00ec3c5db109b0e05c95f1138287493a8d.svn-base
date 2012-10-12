class CreateContactPeople < ActiveRecord::Migration
  def change
    create_table :contact_people do |t|

      t.integer :mini_client_id  #客户id
      t.string :name     #姓名
      t.integer :sex      #性别
      t.integer :contact_nature_id  #联系人性质id
      t.string :position #职务
      t.string :mobile      #手机
      t.string :tel             #电话
      t.string :email          #邮箱
      t.string :qq              #qq
      t.text :description     #备注

      t.integer :created_user_id #创建人


      t.timestamps
    end

    add_index :contact_people,:mini_client_id
    add_index :contact_people,:contact_nature_id
    add_index :contact_people,:mobile

  end
end
