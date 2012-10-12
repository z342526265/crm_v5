class CreateProtectTimes < ActiveRecord::Migration
  def change
    create_table :protect_times do |t|

      t.integer :cate      ,:null=>false   #保护类型
      t.string :name
      t.integer :time_length,:default=>1     #保护时长
      t.text :description

      t.integer :created_user_id
      t.timestamps
    end
    add_index :protect_times,:cate
    add_index :protect_times,:time_length
  end
end
