class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name

      t.integer :nature_id #客户性质（个体户，公司，集团公司）
      t.integer :origin_id #客户来源
      t.integer :grade_id #客户分类

      #t.string :district #地区

      t.string :web_url
      t.string :contact
      t.string :mobile
      t.string :tel
      t.string :fax
      t.string :qq
      t.string :email

      t.string :province #省级
      t.string :city #市级行政区域
      t.string :district #县级行政区域

      t.string :address
      t.string :trade
      t.string :legal_person  #企业法人
      t.integer :fund       #注册资金
      t.date :found_date   #成立日期
      t.string :main_business      #主要业务
      t.string :main_client_base   #主要客户群
      t.string :business_rang       #营业范围
      t.string :business_area       #业务地区
      t.text :description          #描述
      t.string :net_spread  #网络推广情况

      t.boolean :had_order #是否签过单.
      t.integer :status_num,:default=>0 #当前状态 0-公海 1-电话库 2-意向库 3-成单库



      t.string :number #客户编号

      t.integer :orders_count


      t.integer :created_user_id,:null=>false  #创建人
      t.timestamps
    end

    add_index :clients,:name
    add_index :clients,:nature_id
    add_index :clients,:origin_id
    add_index :clients,:grade_id
    add_index :clients,:mobile
    add_index :clients, :orders_count
    add_index :clients, :number
  end
end
