class PaidItem < ActiveRecord::Base
  #attr_accessible :created_user_id, :order_id, :paid_amount
  include SetCreatedUser

  #假删除
  acts_as_paranoid

  belongs_to :order
  belongs_to :order_item


  #审核项
  has_many :check_items,:as=>:check_resource

  #after_save :set_order_item_data
  private
  #设置订单的合同金额
  #设置订单的已收金额
  #def set_order_item_data
  #  received_amount = self.order_item.paid_items.sum{|item|item.received_amount}
  #  owe_amount = self.order_item.contract_amount - received_amount
  #  self.order_item.update_attributes(:received_amount=>received_amount,:owe_amount=>owe_amount)
  #end



end
