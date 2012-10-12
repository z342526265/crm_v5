class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :check_info, :text
    change_column_default :orders,:check_status,1  #修改默认值为 1,=>新建订单审核中
  end
end
