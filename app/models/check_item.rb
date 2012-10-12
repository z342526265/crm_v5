# encoding: utf-8
class CheckItem < ActiveRecord::Base
  # attr_accessible :title, :body

  include SetCreatedUser
  include CustomAssociationMethod

  has_and_belongs_to_many :users
  belongs_to :check_resource, :polymorphic => true
  belongs_to :checked_user,:foreign_key => "checked_user_id",:class_name => "User"

  serialize :attrs,Hash


  #类型
  def check_type
    case self.check_resource_type
      when "Client"
        return "客户相关审核"
      when "Order"
        return "订单相关审核"
    end
  end

  def checked_user_name
    checked_user.name rescue "-"
  end

end
