# encoding: utf-8
class OrderItem < ActiveRecord::Base
  # attr_accessible :title, :body

  include SetCreatedUser
  include CustomAssociationMethod

  #假删除
  acts_as_paranoid

  belongs_to :order
  belongs_to :product
  has_many :paid_items ,:dependent => :destroy
  has_many :renew_fees,:dependent => :destroy


  #审核项
  has_many :check_items,:as=>:check_resource

  has_one :active_check_item,:as=>:check_resource,:class_name => "CheckItem",:conditions => ["is_checked=?",false],:order=>"created_at DESC"


  validates_presence_of :product_id


  def serve_status
    self.serve_end_at > Date.today
  end

  def serve_status_text
    self.serve_status ? "正常服务中..." : "服务已到期"
  end

  def self.custom_create(order,params)
    b = params.values.first.length
    result = []
    for i in (0..b-1)
      h = {}
      params.keys.each do |k|
        h[k]=params[k][i]
      end
      result << h
    end
    order.order_items.create(result)
  end

  ATTR_HASH = {
      "product_id"=>"订单产品",
      "contract_amount"=>"总价",
      "received_amount"=>"已收款项",
      "serve_start_at"=>"服务开始时间",
      "serve_end_at"=>"服务结束时间"
  }

  def change_text(order_item_attrs,order_attrs)
    text = ""
    order_attrs.each do |key,val|
      if self.order.respond_to? key
        case key.to_s
          when "contact_person_id"
            text << "订单联系人 由 #{self.order.contact_person_name} 修改为 #{ContactPerson.find(val).name};" unless self.order.contact_person_id.to_s == val
          when "description"
            text << "订单备注 由 #{self.order.description} 修改为 #{val};" unless self.order.description.to_s == val
        end
      end
    end

    order_item_attrs.each do |key,val|
      if self.respond_to? key
        case key.to_s
          when "product_id"
            text << "产品 由 #{self.product_name} 修改为 #{Product.find(val).name};" unless self.product_id.to_s == val
          when "contract_amount"
            text << "合同价格 由 #{self.contract_amount} 修改为 #{val};" unless self.contract_amount.to_s == val
          when "received_amount"
            text << "已收金额 由 #{self.received_amount} 修改为 #{val};" unless self.received_amount.to_s == val
          when "serve_start_at"
            text << "服务开始时间 由 #{self.serve_start_at.to_s} 修改为 #{val};" unless self.serve_start_at.to_s == val
          when "serve_end_at"
            text << "服务结束时间 由 #{self.serve_end_at.to_s} 修改为 #{val};" unless self.serve_end_at.to_s == val
          when "fee_standard"
            text << "续费标准 由 #{self.fee_standard.to_s} 修改为 #{val};" unless self.fee_standard.to_s == val
        end
      end
    end
    text
  end

  #当前审核状态描述
  def check_status_text
    text = ''
    check_items = self.check_items.where("(cate=1 or cate=2) and is_checked = 0",[1,2])
    check_items.each do |c|
      text << c.description
    end
    text
  end


  before_save :set_data
  after_save :set_order_data,:set_mini_client_serve_due_time

  after_create :set_paid_item

  private

  def set_data
    self.owe_amount = self.contract_amount - self.received_amount
  end

  #设置订单的合同金额
  #设置订单的已收金额
  def set_order_data
    contract_amount = self.order.order_items.sum{|item|item.contract_amount}
    received_amount = self.order.order_items.sum{|item|item.received_amount}
    serve_end_at = self.serve_end_at
    owe_amount = contract_amount - received_amount
    self.order.update_attributes(:contract_amount=>contract_amount,
                                 :received_amount=>received_amount,
                                 :owe_amount=>owe_amount,
                                 :serve_end_at=>serve_end_at
    )
  end

  def set_paid_item
    PaidItem.create(:received_amount=>self.received_amount,:order_item_id=>self.id)
  end

  def set_mini_client_serve_due_time
    mini_client = self.order.mini_client
    dates = mini_client.order_items.map{|item|item.serve_end_at}
    if dates.present?
      mini_client.update_attributes(:serve_due_time_first=>dates.min,:serve_due_time_last=>dates.max)
    end
  end

end
