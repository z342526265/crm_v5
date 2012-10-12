# encoding: utf-8
require "custom_association_method"
require "set_created_user"
class Category < ActiveRecord::Base
  # attr_accessible :title, :body

  include SetCreatedUser
  include CustomAssociationMethod


  #客户必填字段自定义
  CLIENT_FIELD = {"contact" => "联系人","mobile"=>"手机","tel"=>"电话","fax"=>"传真","email"=>"电子邮箱","qq"=>"QQ/MSN"}
  def client_field
    self.description.split(",").map{|a|CLIENT_FIELD[a]}
  end

  def client_field=(val)
    write_attribute(:description,val.join(","))
  end

end
