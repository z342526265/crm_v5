class CreateCheckItems < ActiveRecord::Migration
  def change
    create_table :check_items do |t|
      t.integer :check_resource_id    #对象id
      t.string :check_resource_type   #审核的对象所属的类
      t.string :name                     #审核title
      t.text :description               #备注
      t.text :attrs                      #审核通过后update_attributes的属性hash
      t.integer :checked_user_id        #审核的人
      t.boolean :is_checked ,    :default=>false        #是否已经审核过
      t.boolean :is_approval,:default=>false            #审核结果为是否通过
      t.integer :cate,:default=>1   #审核的类型，0=>增加,1=>修改,2=>删除

      t.integer :created_user_id  #创建人
      t.timestamps
    end

    add_index :check_items, :cate
    add_index :check_items, :created_user_id
    add_index :check_items,:is_checked
    add_index :check_items,:is_approval
    add_index :check_items,:checked_user_id
    add_index :check_items,:check_resource_id
    add_index :check_items,:check_resource_type

  end
end
