# encoding: utf-8
namespace :asset_permission do
  desc "权限的相关操作"


  task(:create_asset_permission=>:environment) do

      #资产查看权限
      p42 = Permission.create({:name=>"资产查看权限",
                               :c_actions=>[
                                   "assets-index","assets-show"
                               ],:cate => 42})
      puts "success...."

      p43 = Permission.create({:name=>"资产管理权限",
                              :c_actions=>[
                                 "assets-create","assets-update","assets-destroy"
                              ],:cate=>43
                              })
    role = Role.find_by_name("总经理")
    role.update_attributes(:permissions=>Permission.all)
    puts "success！"
  end


  #供应商权限
  task(:supplier_permission=>:environment) do
    p44 = Permission.create({:name=>"查看供应商",
                             :c_actions=>[
                                 "suppliers-index","suppliers-show"
                             ],:cate=>44
                            })
    p45 = Permission.create({:name=>"管理供应商",
                             :c_actions=>[
                                 "suppliers-create","suppliers-update","suppliers-destroy"
                             ],:cate=>45
                            })

    role = Role.find_by_name("总经理")
    role.update_attributes(:permissions=>Permission.all)

    puts "success!"
  end

  #低值易耗品库存权限
  task(:stocks=>:environment) do
    p46 = Permission.find_or_create_by_cate(:cate=>46)
    p46.update_attributes({:name=>"查看低值易耗库存",
                           :c_actions=>[
                               "stocks-index","stocks-show"
                           ],:cate=>46})

    p47 = Permission.find_or_create_by_cate(:cate=>47)
    p47.update_attributes({:name=>"管理低值易耗库存",
                           :c_actions=>[
                               "stocks-create","stocks-update","stocks-destroy","stocks-use"
                           ],:cate=>47
                          })

    role = Role.find_by_name("总经理")
    role.update_attributes(:permissions=>Permission.all)

    puts "success!"
  end



end