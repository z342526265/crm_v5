class CreateSuppliers < ActiveRecord::Migration
  def change

    #供应商为客户表中 cate = "supplier"的所有记录

    add_column :clients,:cate,:integer,:default=>0  #在clients表中增加cate字段

    add_index :clients,:cate   #把cate增加为索引

    Client.update_all(:cate=>0)




  end
end
