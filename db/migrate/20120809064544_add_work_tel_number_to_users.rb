class AddWorkTelNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :work_tel_number, :integer,:default=>0
  end
end
