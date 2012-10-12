class CreateTableDepartmentsUsers < ActiveRecord::Migration
  def change
    create_table :departments_users,:id=>false,:force => true do |t|
      t.integer :department_id #用户id
      t.integer :user_id #类型id

      #t.timestamps
    end

    add_index :departments_users,:department_id
    add_index :departments_users,:user_id
  end

end
