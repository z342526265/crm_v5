class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :department_id
      t.text :description
      t.integer :users_count,:default=>0
      t.integer :created_user_id

      t.timestamps
    end
    add_index :positions, :department_id
  end
end
