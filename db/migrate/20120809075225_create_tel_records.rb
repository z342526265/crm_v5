class CreateTelRecords < ActiveRecord::Migration
  def change
    create_table :tel_records do |t|

      #路径
      t.string :path,:default=>""

      #打电话日期
      t.date :tel_date,:default=>"0000-00-00"

      #电话分机监控号
      t.integer :work_tel_number,:default=>0

      #文件名称
      t.string :file_name  ,:default=>""


      t.timestamps
    end
  end
end
