# encoding: utf-8
namespace :permission do
  desc "权限的相关操作"


  task(:update_manager_role=>:environment) do
    role = Role.find_by_name("总经理")
    role.update_attributes(:permissions=>Permission.all)
    puts "增加成功！"
  end

  task(:add_1=>:environment) do
    #给客户查看增加分页的action
    p18 = Permission.find_by_cate(18)   #找到客户详情权限
    p18.c_actions << "mini_clients-ajax_index_table_v2"
    p18.c_actions << "mini_clients-ajax_index_table_v3"
    p18.c_actions << "mini_clients-ajax_index_table_v4"
    p18.save
    puts "success...."
  end

  task(:create_2=>:environment) do
    #增加修改订单的权限
    p37 = Permission.create({:name=>"修改订单",
                             :c_actions=>[
                                 "orders-ajax_update_order_item",
                             ],:cate => 37})
    puts "success...."
  end

  task(:create_3=>:environment) do
    #增加修改订单的权限
    p38 = Permission.create({:name=>"修改用户账号密码",
                             :c_actions=>[
                                 "users-update_account",
                             ],:cate => 38})
    puts "success...."
  end

  #客户修改权限增加action
  task(:add_4=>:environment) do
    #找到客户修改权限
    p15 = Permission.find_by_cate(15)
    p15.c_actions << "clients-ajax_create_mini_client"
    p15.save
    puts "success...."
  end

  task(:create_5=>:environment) do
    #增加修改订单的权限
    p39 = Permission.create({:name=>"订单续费",
                             :c_actions=>[
                                 "orders-add_renew_fee",
                             ],:cate => 39})
    puts "success...."
  end

  task(:add_6=>:environment) do
    #找到客户修改权限
    p24 = Permission.find_by_cate(24)
    p24.c_actions << "orders-ajax_cancel_create"
    p24.c_actions << "orders-ajax_cancel_update"
    p24.save
    puts "success...."
  end

  task(:add_7=>:environment) do
    #找到客户修改权限
    p36 = Permission.find_by_cate(36)
    p36.c_actions << "home-order_show"
    p36.save
    puts "success...."
  end


  task(:add_8=>:environment) do
    #找到客户修改权限
    p1 = Permission.find_by_cate(0)
    p1.c_actions << "home-main_menu"
    p1.save
    puts "success...."
  end


  task(:add_9=>:environment) do
    #找到客户修改权限
    p1 = Permission.find_by_cate(0)
    p1.c_actions << "home-blank_action"
    p1.save
    puts "blank_action add success...."
  end


  task(:add_10=>:environment) do
    #找到客户修改权限
    p1 = Permission.find_by_cate(33)
    p1.c_actions << "clients-destroy"
    p1.save
    puts "clients-destroy add success...."
  end

  task(:create_11=>:environment) do
    #增加客服统计的权限
    p40 = Permission.find_or_create_by_cate({:name=>"客服查询统计",
                                             :c_actions=>[
                                                 "statistics-serve",
                                             ],:cate => 40})

    #给客服经理和客服专员增加查询统计的权限
    role1 = Role.find_by_name("客服经理")
    role2 = Role.find_by_name("客服专员")

    role1.permissions << p40
    role2.permissions << p40

    puts "success...."
  end

  task(:create_12=>:environment) do
    #增加销售统计的权限
    p41 = Permission.find_or_create_by_cate({:name=>"销售查询统计",
                                             :c_actions=>[
                                                 "statistics-sell",
                                             ],:cate => 41})

    #给客服经理和客服专员增加查询统计的权限
    role1 = Role.find_by_name("销售经理")
    role2 = Role.find_by_name("业务员")

    role1.permissions << p41
    role2.permissions << p41


    puts "success...."
  end


#播放录音
  task(:add_13=>:environment) do
    #找到客户修改权限
    p14 = Permission.find_by_cate(14)
    p14.c_actions << "mini_clients-play_record"
    p14.save
    puts "mini_clients-play_record added success...."
  end

  #客户失效的权限
  task(:add_lose=>:environment) do
    #找到管理服务小记的权限
    perm = Permission.find_by_cate(23)
    perm.c_actions << "mini_clients-ajax_lose" unless perm.c_actions.include? "mini_clients-ajax_lose"
    perm.save
    puts "mini_clients-ajax_lose added success...."
  end

  #各种产品的开发步骤增删改查权限
  task(:product_develop_steps=>:environment) do
    p48 = Permission.find_or_create_by_cate({:name=>"产品开发周期管理",
                                             :c_actions=>[
                                                 "product_develop_steps-index",
                                                 "product_develop_steps-create",
                                                 "product_develop_steps-update",
                                                 "product_develop_steps-destroy",
                                             ],:cate => 48})

    #给客服经理和客服专员增加查询统计的权限
    role1 = Role.find_by_name("总经理")
    role1.permissions << p48 unless role1.permissions.include?(p48)

    puts "产品开发周期管理的权限已经添加...."

  end

  #技术部一般权限
  task(:order_develop_steps=>:environment) do
    p = Permission.find_or_create_by_cate({:name=>"技术部一般权限",:cate => 49})
    p.update_attributes(:c_actions=>[
        "order_develop_steps-index",
        "order_develop_steps-distribute",
        "order_develop_steps-update",
        "order_develop_steps-my_develop_steps",
        "order_develop_steps-complete",
        "order_develop_steps-complete_distribute",
        "order_develop_steps-check",
        "order_develop_steps-apply_delay_complete",  #延期申请权限
        "order_develop_steps-delay_check",  #延期申请查看、审核
        "order_develop_steps-agree_delay",  #同意延期
        "order_develop_steps-disagree_delay",  #不同意延期
    ])

    #给客服经理和客服专员增加查询统计的权限
    role1 = Role.find_by_name("总经理")
    role1.permissions << p unless role1.permissions.include? p

    puts "技术部一般权限已经是最新...."

  end



end