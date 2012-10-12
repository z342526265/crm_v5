# encoding: utf-8
#数据库操作
namespace :database do

  #修改所有已有订单的状态为已完成，在订单开发步骤上线前，运行
  task(:update_all_orders_become_complete=>:environment) do
    Order.where("created_at < '2012-10-09'").update_all(:develop_status=>4)
    puts "success！"
  end


  #初始化 develop_steps数据，删除用于测试的几条数据
  task(:destroy_develop_steps_with_test=>:environment) do
    DevelopStep.where("develop_step_resource_type='Order'").destroy_all
    puts "success !"
  end


end