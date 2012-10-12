class AddIndexToTelRecords < ActiveRecord::Migration
  def change
    add_index :tel_records, :tel_date
    add_index :tel_records, :work_tel_number
    add_index :tel_records, :file_name
  end
end
