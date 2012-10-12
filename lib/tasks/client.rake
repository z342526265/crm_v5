# encoding: utf-8
namespace :client do
  #desc "客户相关操作"
  #
  #require "pp"
  #require "csv"
  #
  #task(:import=>:environment) do
  #  file_path = ENV["file"]
  #  if file_path[-4,4] != ".csv"
  #    puts "导入文件格式必须为csv格式！"
  #    return false
  #  end
  #
  #  i = 0
  #  CSV.foreach(file_path,:encoding=>"gbk") do |row|
  #    #next if i == 0
  #    i += 1
  #    pp row
  #    ActiveRecord::Base.transaction do
  #      client = Client.create(:name=>row[0],:contact=>row[1],:tel=>row[2],:mobile=>row[3],:address=>row[4],:description=>row[5],:created_user_id=>1)
  #      pp "1111111111"
  #      mini_client = client.mini_clients.build
  #      mini_client.update_attributes(:grade_id=>3,:origin_id=>30,:public_store_id=>2,:status_num=>0,:due_time=>Time.now)
  #    end
  #  end
  #end


  task :destroy_mini_clients=>:environment do
    clients = Client.includes(:mini_clients).where("clients.number in (?) and mini_clients.status_num = 0",(379..4323))
    clients.each do |c|
      pp c.number
      c.destroy
    end
    puts "删除成功！"
  end

end