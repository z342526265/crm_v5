# encoding: utf-8
class Asset < ActiveRecord::Base

  include SetCreatedUser
  include CustomAssociationMethod

  belongs_to :user
  belongs_to :supplier
  belongs_to :purchase_user,:foreign_key => "purchase_user_id",:class_name => "User"
  belongs_to :asset_cate,:foreign_key => "asset_cate_id",:class_name => "Category"
  belongs_to :purchase_way,:foreign_key => "purchase_way_id",:class_name => "Category"

  has_many :update_logs,:as=>:update_logs_resource,:order=>"Created_at DESC"


  before_create :set_number

  before_update :set_update_log
  after_update :save_update_log


  PURCHASE_WAY = [["网上购物",0],["亲自采购",1]]
  CATE = [["电话",0],["电脑",1]]

  #def purchase_way_name
  #  PURCHASE_WAY[self.purchase_way_id].first
  #end


  private
  def set_number
    count_num = Asset.find_all_by_asset_cate_id(self.asset_cate_id).count + 1
    num = 4-count_num.to_s.length
    self.number = self.asset_cate.description + "0"*num + count_num.to_s
  end

  COLUMNS = {
      "name"=>"资产名称",
      "number"=>"编号",
      "brand"=>"品牌",
      "standard"=>"规格",
      "purchase_date"=>"采购日期",
      "purchase_price"=>"采购价格",
      "description"=>"备注",
      "count"=>"数量",
      "used_date"=>"使用日期",
      #"cate"=>"资产类型",
      "unit"=>"计量单位"
  }

  #设置编辑日志
  def set_update_log
    if self.changed?
      content = ""
      #pp self.changes
      #pp "=============="
      self.changes.each do |key,val|
        if COLUMNS[key]
          content << "【#{COLUMNS[key]}】由【#{val.first}】更改为【#{val.second}】;" if val.second.present?
        else
          #pp "else"
          #pp "ddddddd"
          case key
            when "asset_cate_id"
              a =  Category.find(val.first).name rescue ""
              content << "【资产类型】由【#{a}】更改为【#{self.asset_cate_name}】;"
            when "user_id"
              #pp "999999999999999"
              a =  Category.find(val.first).name rescue ""
              content << "【资产使用人】由【#{a}】更改为【#{self.user_name}】;"
            when "supplier_id"
              a =  Category.find(val.first).name rescue ""
              content << "【供应商】由【#{a}】更改为【#{self.supplier_name}】;"
            when "purchase_user_id"
              a =  Category.find(val.first).name rescue ""
              content << "【采购人】由【#{a}】更改为【#{self.purchase_user_name}】;"
            when "purchase_way_id"
              a =  Category.find(val.first).name rescue ""
              content << "【采购方式】由【#{a}】更改为【#{self.purchase_way_name}】;"
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
