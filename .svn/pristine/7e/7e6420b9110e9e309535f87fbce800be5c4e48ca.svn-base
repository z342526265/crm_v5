class AddClientNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :client_name, :string

    Order.with_deleted.each do |order|
      order.update_attribute(:client_name,order.mini_client_name)
    end

  end
end
