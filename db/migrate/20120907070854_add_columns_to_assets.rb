class AddColumnsToAssets < ActiveRecord::Migration
  def change
    add_column :assets,:cate,:integer,:default=>0   #资产类型   0,固定资产  1，低值易耗品
    add_column :assets,:unit,:string,:default=>""   #计量单位
    add_column :assets,:count,:decimal   #数量

    add_index :assets,:cate
  end
end
