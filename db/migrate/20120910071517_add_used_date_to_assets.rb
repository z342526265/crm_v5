class AddUsedDateToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :used_date, :date
  end
end
