class AddDeletedAtToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :deleted_at, :datetime
  end
end
