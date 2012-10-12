class CreateDevelopSteps < ActiveRecord::Migration
  def change
    create_table :develop_steps do |t|

      t.integer :develop_step_resource_id
      t.string :develop_step_resource_type

      t.column :name,:string
      t.column :user_id,:integer #开发人员
      t.column :description,:text #备注
      t.column :is_complete,:boolean,:default=>false #备注

      t.column :standard_period,:integer  #标准开发周期，天
      t.column :standard_date,:date         #标准开发完成时间 ，日期

      t.column :request_date,:date #要求完成的时间
      t.column :complete_date,:date #实际完成时间

      t.column :ordinal_number,:integer,:null=>false #顺序号

      t.integer :created_user_id   #创建人

      t.column :develop_status,:integer,:default=>0  #开发状态 0=>开发中  1=>审核中  2=>已完成 3=>延期申请中 4=>延期申请通过

      #当前已延期次数
      t.column :delay_count,:integer,:default=>0

      t.column :submit_checking_date,:date   #提交审核的日期
      t.column :checking_date,:date  #审核日期



      t.timestamps
    end



  end
end
