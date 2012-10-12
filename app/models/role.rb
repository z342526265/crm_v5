class Role < ActiveRecord::Base
  # attr_accessible :title, :body

  include SetCreatedUser
  include CustomAssociationMethod

  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions


  #CATE = [["一般",0],["中级",1],["高级",2]]

  #attr_accessible :name,:description,:cate,:permission

  #def self.company_manager?
  #  self.any?{|r|r.cate == 2}
  #end
  #
  #def self.department_manager?
  #  self.any?{|r|r.cate == 1}
  #end
  #
  #def cate_text
  #  CATE[self.cate].first
  #end
  #
  ##是否含有服务小记权限
  #def has_serve_record_permission?
  #  self.permission.include?("clients-ajax_serve_record_create")
  #end
  #
  ##拥有某些权限的角色
  #def self.has_permission(permission_text)
  #  self.all.select{|role|role.permission.include?(permission_text)}
  #end



end
