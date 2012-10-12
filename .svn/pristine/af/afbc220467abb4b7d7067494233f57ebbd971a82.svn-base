# encoding: utf-8
require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

#定义每10分钟
scheduler.every("30m") do

  #自动调入公海
	MiniClient.where("due_time < ? and due_time > ? and status_num in (?)",Time.now,Time.now - 1.hour,[1,2,3]).update_all(:status_num => 0)

  #自动删除名称为空的客户
  Client.where("name is null").destroy_all

  #删除客户创建日志
  UpdateLog.where("content like '【客户姓名】由【】更改为【%'").delete_all

end

#每5分钟执行一次
#scheduler.every("5m") do
#  Order.joins(:develop_steps).where("")
#end

   #scheduler.cron '0 22 * *' do
   #  # every day of the week at 00:22
   #  #puts 'activate security system'
   #
   #  #User.where("")
   #
   #end