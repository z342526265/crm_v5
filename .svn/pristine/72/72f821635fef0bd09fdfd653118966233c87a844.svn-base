# encoding: utf-8
class Order < ActiveRecord::Base
  # attr_accessible :title, :body

  include SetCreatedUser
  include CustomAssociationMethod

  #假删除
  acts_as_paranoid

  #belongs_to :created_user,:foreign_key => "created_user_id",:class_name => "User"
  belongs_to :mini_client,:counter_cache => true
  belongs_to :client,:counter_cache => true
  belongs_to :contact_person,:foreign_key => "contact_person_id",:class_name=>"ContactPerson"

  has_many :order_items,:dependent => :destroy
  has_one :order_item

  accepts_nested_attributes_for :order_items

  has_many :paid_items,:dependent => :destroy

  has_many :check_items,:as=>:check_resource,:dependent => :destroy
  has_one :active_check_item,:as=>:check_resource,:class_name => "CheckItem",:conditions => ["is_checked=?",false],:order=>"created_at DESC"

  #拥有多个开发步骤
  has_many :develop_steps,:as => :develop_step_resource,:dependent => :destroy,:order => "ordinal_number ASC"

  #最后一个开发步骤
  #has_one :last_develop_step,:as => :develop_step_resource,:dependent => :destroy,:conditions => [""]

  #找到最后一个开发步骤
  def last_develop_step
    self.develop_steps.last
  end

  #validates_presence_of :product_id

  #审核状态
  CHECK_STATUS = {0=>"正常状态",1=>'新建订单审核中',2=>"新建订单被驳回",3=>"修改订单审核中",4=>"修改订单驳回",5=>"付欠款审核中",6=>"续费审核中"}

  def check_status_text
    CHECK_STATUS[self.check_status] rescue "-"
  end

  def serve_status
    self.order_items.any?{|item|item.serve_end_at > Date.today}
  end

  def serve_status_text
    self.serve_status ? "正常服务中..." : "所有订单的服务已到期！"
  end

  def order_items_attributes
    attrs = {}
    self.order_items.each_with_index do |item,i|
      attrs[i.to_s]=item.attributes
    end
    attrs
  end

  #创建对应的开发步骤
  def create_develop_steps
    attr_hash = self.order_item.product.develop_steps.order(:ordinal_number).map{|step|{:name=>step.name,:standard_period=>step.standard_period,:ordinal_number=>step.ordinal_number}}
    self.develop_steps.create(attr_hash)
  end

  def develop_status_text
    case develop_status
      when 0
        "未分配"
      when 1
        "已分配，开发中"
      when 2
        "延期申请中"
      when 3
        "延期通过，已延期次数#{self.delay_count}"
      when 4
        "已完成"
      else
        "-"
    end
  end

  before_create :set_data1
  #after_create :create_develop_steps
  after_destroy :set_client_status


  private

  def set_data1
    count_num = Order.with_deleted.count + 1
    num = 6-count_num.to_s.length
    self.number = "0"*num + count_num.to_s
    self.client_name = self.mini_client_name
    #self.created_user = User.current
  end

  def set_client_status
    self.mini_client.update_attribute(:status_num,3) if self.mini_client.orders.count == 0
  end





end