# encoding: utf-8
require "active_record"

#连接数据库
ActiveRecord::Base.establish_connection(
    :adapter => "mysql2",
    :host => "192.168.1.2",
    :database => "crm_v5_production",
    :username => "root",
    :password => "cinter.",
    :encoding => "utf8"
)

class TelRecord < ActiveRecord::Base
end

(0..17).each do |i|
  puts i
  today_str = (Date.today - i.day).to_s.gsub("-","") 
  puts today_str
  file_path = "E:/TMNData/#{today_str}"
  if File.directory? file_path
    Dir.foreach(file_path) do |file|
      next if file == "." || file == ".."
      # pp file
      _file_path = file_path+"/"+file
      Dir.foreach(_file_path) do |f|
        next if f == "." || f == ".."
        # puts f
        TelRecord.find_or_create_by_path(
        {
          :tel_date => Date.today-i.day,
          :work_tel_number => file,
          :file_name => f,
          :path => today_str+"/"+file+"/"+f,
        })
      end
    end
  end
end