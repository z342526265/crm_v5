# encoding: utf-8
class Permission < ActiveRecord::Base
  # attr_accessible :title, :body

  #include SetCreatedUser
  include CustomAssociationMethod

  has_and_belongs_to_many :roles

  has_many :users,:through => :roles,:class_name => "User",:uniq => true,:select => "distinct users.*"


  #CATE = {
  #    1=>"部门管理权限",
  #    2=>"岗位管理权限",
  #    3=>"角色管理权限",
  #    4=>"员工管理权限"
  #}

  serialize :c_actions,Array


end
