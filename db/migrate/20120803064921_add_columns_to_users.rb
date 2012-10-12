class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_expert, :boolean,:default=>false
  end
end
