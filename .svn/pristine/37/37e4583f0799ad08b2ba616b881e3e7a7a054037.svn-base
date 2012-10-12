# encoding: utf-8
class ContactPerson < ActiveRecord::Base

  include SetCreatedUser
  include CustomAssociationMethod
  # attr_accessible :title, :body

  belongs_to :mini_client ,:counter_cache => true

  belongs_to :contact_nature,:foreign_key => "contact_nature_id",:class_name => "Category",
             :conditions => ["cate=?","contact_nature"]
  has_many :update_logs,:as=>:update_logs_resource

  validates_presence_of :name#,:contact_nature_id
  validates_presence_of :mobile,:if=>Proc.new{|a|a.tel.blank?}
  validates_presence_of :tel,:if=>Proc.new{|a|a.mobile.blank?}

  def sex_text
    case self.sex
      when 0
        "未知"
      when 1
        "男"
      when 2
        "女"
    end
  end


  before_update :set_update_log
  after_update :save_update_log

  COLUMNS = {
      "name"=>"姓名",
      #"sex"=>"性别",
      "position"=>"职位",
      "mobile"=>"手机",
      "tel"=>"电话",
      "fax"=>"传真",
      "qq"=>"QQ/MNS",
      "email"=>"Email",
      "description"=>"备注"
  }

  SEX = {0=>"未知",1=>"男",2=>"女"}


  private

  #设置编辑日志
  def set_update_log
    if self.changed?
      content = ""
      self.changes.each do |key,val|
        if COLUMNS[key]
          content << "【#{COLUMNS[key]}】由【#{val.first}】更改为【#{val.second}】;" if val.second.present?
        else
          case key
            when "contact_nature_id"
              a =  Category.find(val.first).name rescue ""
              "【联系人重要性】由【#{a}】更改为【#{self.contact_nature_name}】;"
            when "sex"
              a =  SEX[val.first] rescue ""
              content << "【联系人重要性】由【#{SEX[val.first]}】更改为【#{self.sex_text}】;"
          end
        end
      end
      @update_log = self.update_logs.build(:created_user_id=>User.current.id,:content=>content)
    end
  end

  #保存编辑日志
  def save_update_log
    @update_log.save if @update_log
  end



end
