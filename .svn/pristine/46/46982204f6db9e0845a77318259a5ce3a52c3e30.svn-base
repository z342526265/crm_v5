# encoding: utf-8
department1 = Department.create(:name => "总经理办公室",:description=>"总经理办公室",:cate => 1)
department2 = department1.children.create(:name => "商务部",:description=>"商务部",:cate => 2)
department3 = department1.children.create(:name => "技术部",:description=>"商务部",:cate => 2)

position1 = department1.positions.create({:name => "销售经理"})
position2 = department2.positions.create({:name=>"业务员"})
position3 = department3.positions.create({:name=>"开发工程师"})
puts "create initialize department success!"

puts "导入初始权限数据"

#s首页权限
p1 = Permission.create({:name=>"首页权限",:c_actions=>["home-index"],:cate=>0})

#部门管理权限
p2 = Permission.create({:name=>"部门查看",:c_actions=>["departments-index","departments-show"],:cate => 1})
p3 = Permission.create({:name=>"部门管理",:c_actions=>["departments-new","departments-create","departments-edit","departments-update","departments-destroy"],:cate => 2})

#职位管理权限
p4 = Permission.create({:name=>"岗位查看",:c_actions=>["positions-index","positions-show"],:cate => 4})
p5 = Permission.create({:name=>"岗位管理",:c_actions=>["positions-new","positions-create","positions-edit","positions-update","positions-destroy"],:cate => 5})

#角色管理权限
p6 = Permission.create({:name=>"角色查看",:c_actions=>["roles-index","roles-show"],:cate => 6})
p7 = Permission.create({:name=>"角色管理",:c_actions=>["roles-new","roles-create","roles-edit","roles-update","roles-destroy"],:cate => 7})

#员工管理权限
p8 = Permission.create({:name=>"员工查看",:c_actions=>["users-index","users-show"],:cate => 8})
p9 = Permission.create({:name=>"员工管理",:c_actions=>["users-new","users-create","users-edit","users-update","users-lock","users-unlock"],:cate => 9})
p10 = Permission.create({:name=>"基本信息编辑",:c_actions=>["users-basic_information"],:cate => 10})
p11 = Permission.create({:name=>"家庭信息编辑",:c_actions=>["users-family_information"],:cate => 11})
p12 = Permission.create({:name=>"岗位信息编辑",:c_actions=>["users-position_information"],:cate => 12})

#系统设置
p13 = Permission.create({:name=>"系统设置权限",:c_actions=>["categories-index","categories-new",
                                                      "categories-create","categories-edit","categories-update",
                                                      "categories-destroy","categories-update_protect_time",
                                                      "categories-protect_time_index",
                                                      "not_category_settings-user_public_store_index","not_category_settings-add_public_store_to_user",
                                                      "not_category_settings-protect_client_count_index","not_category_settings-protect_client_count_create",
                                                      "not_category_settings-protect_client_count_update"],
                         :cate => 13})

p14 = Permission.create({:name=>"客户查看",:c_actions=>["mini_clients-index","mini_clients-ajax_index","mini_clients-show","mini_clients-ajax_paginate",
                                                    "mini_clients-my_follow_clients","mini_clients-ajax_index_v2",
                                                    "mini_clients-ajax_change_page"],:cate => 14})

p15 = Permission.create({:name=>"客户增删改",:c_actions=>["mini_clients-new","mini_clients-create","mini_clients-edit","mini_clients-update","mini_clients-destroy",
                                                     "mini_clients-ajax_search","mini_clients-ajax_mobile_search","mini_clients-ajax_update_client"],:cate => 15})

p16 = Permission.create({:name=>"电话库/意向库",:c_actions=>["mini_clients-add_to_general_personal_store","mini_clients-remove_to_public_personal_store",
                                                       "mini_clients-add_to_had_intention_personal_store","mini_clients-multi_process"],:cate => 16})

p17 = Permission.create({:name=>"批量导入客户",:c_actions=>["mini_clients-client_export_template","mini_clients-client_import"],:cate => 17})

p18 = Permission.create({:name=>"客户详情",:c_actions=>["mini_clients-ajax_index","mini_clients-ajax_show",
                                                    "mini_clients-ajax_client_update_log",
                                                    "categories-ajax_result",
                                                    "mini_clients-ajax_contact_list_update_log",
                                                    'mini_clients-ajax_show_contact_records','mini_clients-update_grade'],:cate => 18})

p19 = Permission.create({:name=>"更改客户类别",:c_actions=>["mini_clients-update_grade"],:cate=>19})

p20 = Permission.create({:name=>"管理联系记录",:c_actions=>["mini_clients-ajax_create_contact_record"],:cate=>20})

p21 = Permission.create({:name=>"管理联系人",:c_actions=>["mini_clients-ajax_submit_contact",
                                                     "mini_clients-ajax_destroy_client_list",
                                                     "mini_clients-ajax_update_contact_list"],:cate=>21})

p22 = Permission.create({:name=>"查看服务小记",:c_actions=>['mini_clients-ajax_serve_records_show',"mini_clients-my_serve_clients",
                                                      "mini_clients-ajax_index_v4","mini_clients-my_serve_clients"],:cate=>22})
p23 = Permission.create({:name=>"管理服务小记",:c_actions=>["mini_clients-ajax_serve_record_create",'mini_clients-ajax_serve_record_update','categories-ajax_result_serve_record',
                                                      'mini_clients-ajax_serve_record_destroy','mini_clients-ajax_serve_records_show'],:cate=>23})

p24 = Permission.create({:name=>"订单管理权限",:c_actions=>["orders-index",'orders-create',
                                                      'orders-ajax_apply_destroy',
                                                      'orders-ajax_apply_update',
                                                      'orders-ajax_show',
                                                      'orders-ajax_create',
                                                      'orders-ajax_index'],:cate=>24})

p25 = Permission.create({:name=>"订单查看权限",:c_actions=>["orders-index",'orders-ajax_show','orders-ajax_index'],:cate=>25})

p26 = Permission.create({:name=>"公司产品查看",:c_actions=>["products-index",'products-show'],:cate=>26})

p27 = Permission.create({:name=>"公司产品管理",:c_actions=>["products-index",'products-create','products-new',
                                                      'products-edit','products-update','products-destroy','products-show'],:cate=>27})

p28 = Permission.create({:name=>"查询统计",:c_actions=>["check_items-index"],:cate=>28})

p29 = Permission.create({:name=>"客户审核",:c_actions=>["clients-check"],:cate=>29})

p30 = Permission.create({:name=>"分配成单客户给客服",:c_actions=>["mini_clients-distribute_client_to_server"],:cate=>30})

p31 = Permission.create({:name=>"订单相关审核权限",:c_actions=>["orders-check"],:cate=>31})

p32 = Permission.create({:name=>"公海信息维护",
                         :c_actions=>["public_stores-index",
                                      "public_stores-new",
                                      "public_stores-create",
                                      "public_stores-edit",
                                      "public_stores-update",
                                      "public_stores-destroy",
                         ],:cate=>32})

p33 = Permission.create({:name=>"基本客户（client）权限",
                         :c_actions=>[
                             "clients-index",
                             "clients-show",
                             "clients-edit",
                             "clients-update",
                             "clients-multi_process",
                         ],:cate => 33})
p34 = Permission.create({:name=>"成单客户权限",
                         :c_actions=>[
                             "mini_clients-my_clients_of_had_orders",
                             "mini_clients-ajax_index_v3",
                         ],:cate => 34})

p35 = Permission.create({:name=>"增加订单付款",
                         :c_actions=>[
                             "orders-add_paid_item",
                         ],:cate => 35})

p36 = Permission.create({:name=>"订单相关审核",
                         :c_actions=>[
                             "orders-check",
                         ],:cate => 36})



puts "创建用户"
User.delete_all
u1 = User.create({:login=>"xiaoshoujingli",:email=>"xiaoshoujingli@gmail.com",:password=>"xiaoshoujingli",
                  :password_confirmation=>"xiaoshoujingli",:name=>"销售经理",:sex=>1,
                  :department_id=>department2.id,:position_id => position2.id})
u2 = User.create({:login=>"yewuyuan",:email=>"yewuyuan@gmail.com",:password=>"yewuyuan",
                  :password_confirmation=>"yeuwuyuan",:name=>"业务员",:sex=>1,
                  :department_id=>department2.id,:position_id => position2.id})
u3 = User.create({:login=>"shouhoujingli",:email=>"shouhoujiangli@gmail.com",:password=>"shouhoujingli",
                  :password_confirmation=>"shouhoujingli",:name=>"售后经理",:sex=>1,
                  :department_id=>department3.id,:position_id => position3.id})

u4 = User.create({:login=>"shouhoukefu",:email=>"shouhoukefu@gmail.com",:password=>"shouhoukefu",
                  :password_confirmation=>"shouhoukefu",:name=>"shouhoukefu",:sex=>1,
                  :department_id=>department3.id,:position_id => position3.id})

puts "创建角色"
general_permissions = [p1,p6,p8,p10,p14]
client_permissions = [p15,p16,p17,p18,p19,p20,p21]
after_sale_permissions = [p22,p23]
Role.delete_all
r1 = Role.create({:permission_ids=>(general_permissions+client_permissions).map{|p|p.id},:cate=>1,:name=>"销售经理",:description=>"",:protect_client_count=>10})
r2 = Role.create({:permission_ids=>(general_permissions+client_permissions+[p29]).map{|p|p.id},:cate=>0,:name=>"业务员",:description=>"",:protect_client_count=>10})
r3 = Role.create({:permission_ids=>(general_permissions+after_sale_permissions+[p30]).map{|p|p.id},:cate=>1,:name=>"售后经理",:description=>"",:protect_client_count=>10})
r4 = Role.create({:permission_ids=>(general_permissions+after_sale_permissions).map{|p|p.id},:cate=>0,:name=>"售后客服",:description=>"",:protect_client_count=>10})

puts "角色创建完成！"

puts "分配角色给用户"
u1.roles << r1
u2.roles << r2
u3.roles << r3
u4.roles << r4


# 创建初始角色,不能删除和修改名称的角色
puts "Create admin ......"
User.find_or_create_by_login(:login=>"admin",:email=>"admin@gmail.com",:password=>"administrator",
                             :password_confirmation=>"administrator",:name=>"超级管理员",
                             :cate=>3*1415926,:department_id=>Department.first.id,:position_id => Position.first.id )

#permission=Permission.all.map{|p|p.c_actions}.flatten.uniq
#permission
puts "创建总经理。。。。"
role = Role.find_or_initialize_by_name({:name=>"总经理"})
role.save
role.update_attributes(:permissions=>Permission.all,:cate=>2,:description=>"总经理,拥有全部权限",:protect_client_count=>10)
manager = User.create(:login=>"manager",:email=>"general_manager@gmail.com",:password=>"manager",
                      :password_confirmation=>"manager",:name=>"杨总",:sex=>true,
                      :department_id=>Department.first.id,:position_id => Position.first.id)
manager.roles << role
puts "总经理账号创建成功，密码manager,账号manager"
puts "permission data import complete !"


Category.delete_all
puts "Create initialize Category...."
Category.create [{:name=>"A类",:cate=>"client_grade",:need_verify=>true},
                 {:name=>"B类",:cate=>"client_grade",:need_verify=>true},
                 {:name=>"C类",:cate=>"client_grade",:need_verify=>false},
                 {:name=>"D类",:cate=>"client_grade",:need_verify=>false}]

Category.create [{:name=>"陌生拜访信息",:cate=>"client_origin"},
                 {:name=>"老销售人员沉淀",:cate=>"client_origin"},
                 {:name=>"本地媒体信息",:cate=>"client_origin"}]

PublicStore.create [{:name=>"普通公海一"},
                    {:name=>"普通公海二"}]

#Category.create [{:name=>"普通客户库",:cate=>"personal_store",:level=>1},
#                 {:name=>"意向客户库",:cate=>"personal_store",:level=>2},
#                 {:name=>"成单客户库",:cate=>"personal_store",:level=>3}
#                ]

#Department.first.categories= Category.all

Category.create [{:name=>"公司客户",:cate=>"nature"},
                 {:name=>"个体户",:cate=>"nature"}]

#跟客户联系的结果
#Category.create [{:name=>"有效的联系，跟客户进行了有效的沟通",:cate=>"contact_result",:need_verify=>true},
#                 {:name=>"无效的联系，客户接电话后挂了",:cate=>"contact_result",:need_verify=>false}]

#跟客户联系的方式
Category.create [{:name=>"电话联系",:cate=>"contact_way"},
                 {:name=>"到客户公司拜访",:cate=>"contact_way"}]

Category.create [{:name=>"一般",:cate=>"contact_nature"},
                 {:name=>"重要",:cate=>"contact_nature"}]

Category.create [{:name=>"网站",:cate=>"product_category"},
                 {:name=>"优化",:cate=>"product_category"}]

#添加联系记录是初始需要被选中的东西
Category.create [
                    #{:name=>"普通网站",:cate=>"introduce_product"},
                    #{:name=>"中型网站",:cate=>"introduce_product"},
                    #{:name=>"网站优化",:cate=>"introduce_server"},
                    {:name=>"开发速度快",:cate=>"interest_point"},
                    {:name=>"收费有点高",:cate=>"dissent_point"},
                    {:name=>"客户接到电话就挂了",:cate=>"invalid_contact_description"}
                ]

#模糊搜索时屏蔽字段
Category.create [{:description=>"南阳,市,有限,公司",:cate=>"shield"}]

#必填字段
Category.create [{:description=>"contact",:cate=>"client_field"}]

#保护时间设定
ProtectTime.create [{:name=>"电话客户",:time_length=>86400,:cate=>2},
                    {:name=>"保护客户",:time_length=>86400,:cate=>3},
                    {:name=>"自己录入",:time_length=>86400,:cate=>1}
                   ]

Product.create([{:name=>"初级网站建设",:cate=>0,:category_id=>Category.find_all_by_cate("product_category").first.id},{:name=>"网站优化",:cate=>1,:category_id=>Category.find_all_by_cate("product_category").second.id}])

# 把公海跟员工关联起来
PublicStore.all.each do |p|
  p.users = User.all
end


puts "over...."


