class AddProcessFlowToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :process_flow, :integer,:default=>0     #订单工序流程   0,新订单；1=>已完成开发
    add_column :orders,:develop_status,:integer,:default=>0     #当前订单的开发状态 0,未分配状态
    add_column :orders,:delay_count,:integer,:default=>0         #延期申请次数
    Order.update_all(:process_flow=>0,:develop_status=>0,:delay_count=>0)
  end
end
