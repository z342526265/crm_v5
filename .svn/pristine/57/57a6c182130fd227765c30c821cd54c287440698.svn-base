class CreateApplyDelayCompletes < ActiveRecord::Migration
  def change
    create_table :apply_delay_completes do |t|

      t.string :name,:default=>""
      t.integer :develop_step_id
      t.integer :created_user_id  #创建人

      t.date :apply_delay_date  #延期日期

      t.integer :check_status,:default=>0 #审核状态 0=>审核中，1=>通过，2=》驳回

      t.text :apply_delay_reason   #延期理由

      t.timestamps
    end
  end
end
