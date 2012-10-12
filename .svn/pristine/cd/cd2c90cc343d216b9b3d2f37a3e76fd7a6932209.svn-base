class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id      #客户
      t.string :number            #编号
      t.text :description        #描述
      t.text :contact_person_id        #联系人
      t.integer :created_user_id

      #{0=>"正常状态",1=>'新建订单',2=>"修改订单",3=>"申请删除",4=>"驳回订单",5=>"增加续费",6=>"付欠款"}
      t.integer :check_status,:limit=>2,:default=>0      #

      t.decimal :contract_amount,:default=>0,:precision => 8, :scale => 2
      t.decimal :received_amount,:default=>0 ,:precision => 8, :scale => 2
      t.decimal :owe_amount,:default=>0 ,:precision => 8, :scale => 2

      t.date :serve_start_at,:default=>Date.today
      t.date :serve_end_at,:default=>Date.today + 1.years


      t.integer :mini_client_id

      t.timestamps
    end


    add_index :orders, :mini_client_id
    add_index :orders, :check_status
    add_index :orders,:client_id
    add_index :orders,:created_user_id
    add_index :orders,:number
  end
end
