# encoding: utf-8
class Import

  def import_client(file_path)
    require "pp"
    require "csv"
    if file_path[-4,4] != ".csv"
      puts "导入文件格式必须为csv格式！"
      return false
    end
    i = 0
    CSV.foreach(file_path,:encoding=>"gbk") do |row|
      i += 1
      pp i
      pp row
      unless Client.find_by_name(row[0]).present?
        ActiveRecord::Base.transaction do
          client = Client.new(:name=>row[0],:contact=>row[1],:tel=>row[2],:mobile=>row[3],:address=>row[4],:description=>row[5],:grade_id=>3)
          client.save!
          nature_id = 8
          if /个体经营|个人/.match row[0]
            nature_id = 9
          end
          pp nature_id
          mini_client = client.mini_clients.build(:nature_id => nature_id,:grade_id=>3,:origin_id=>30,:public_store_id=>2)
          mini_client.save!
          mini_client.update_attributes(:status_num=>0)
          mini_client.update_attributes(:due_time=>Time.now)
        end
      end
    end
  end

end