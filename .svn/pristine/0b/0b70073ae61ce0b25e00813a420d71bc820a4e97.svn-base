class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,              :null => false, :default => ""
      t.string :hashed_password, :null => false, :default => ""
      t.string :salt,:null => false,:default => ""
      t.string :login,                :null=>false,:default=>""
      t.column :name,:string  #姓名
      t.column :sex,:integer  #性别
      t.column :department_id,:integer  #部门id

      t.column :manager_department_id,:integer #管理的部门id


      t.column :position_id,:integer  #职位id
      t.column :role_id,:integer  #角色if
      t.column :mobile,:string  #手机
      t.column :tel,:string  #电话
      t.column :qq,:string  #QQ
      t.column :enter_date,:date  #入职日期
      t.column :birth,:date  #出生日期
      t.column :nation,:integer  #民族
      t.column :marriage_status,:integer  #婚姻
      t.column :last_college,:string  #毕业院校
      t.column :edu_level,:integer  #学历
      t.column :identity_card,:string  #身份证号
      t.column :current_address,:string  #现住址
      t.column :family_address,:string  #家庭住址
      t.column :father,:string  #父亲
      t.column :father_birth,:date  #父亲生日
      t.column :father_mobile,:string   #父亲手机
      t.column :mother,:string  #母亲姓名
      t.column :mother_birth,:date  #母亲生日
      t.column :mother_mobile,:string #母亲手机
      t.column :comment,:text  #备注
      t.column :is_lock,:boolean,:default => false #是否锁定
      t.column :cate,:integer,:default=>0 #账户类型

      #头像图片
      t.column :person_image_file_name, :string
      t.column :person_image_content_type, :string
      t.column :person_image_file_size, :integer
      t.column :person_image_updated_at, :datetime

      #身份证复印件图片
      t.column :identity_image_file_name, :string
      t.column :identity_image_content_type, :string
      t.column :identity_image_file_size, :integer
      t.column :identity_image_updated_at, :datetime


      t.has_attached_file :person_image
      t.has_attached_file :identity_image

      t.boolean :is_manager,:default=>false   #是否是自己部门的管理者,每个人只能属于一个部门,一个部门可以有多个管理者

      t.integer :created_user_id  #创建人
      t.timestamps
    end

    add_index :users, :login,                :unique => true
    #add_index :users, :reset_password_token
    add_index :users,:department_id  #部门id
    add_index :users,:position_id  #职位id
    add_index :users,:cate  #职位id
  end
end
