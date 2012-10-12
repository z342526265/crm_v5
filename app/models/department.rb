# encoding: utf-8
#require ""
class Department < ActiveRecord::Base
  # attr_accessible :title, :body
  include SetCreatedUser
  include CustomAssociationMethod


  has_many :positions,:dependent => :destroy

  #每个部门有多个下属员工
  has_many :staffs,:foreign_key => "department_id",:class_name => "User"

  #每个部门有多个管理者
  has_and_belongs_to_many :managers,:class_name => "User"

  #上级部门
  belongs_to :parent,:foreign_key => "parent_id",:class_name => "Department"
  #下级部门
  has_many :children,:foreign_key => "parent_id",:class_name => "Department"


  has_many :mini_clients,:through => :users
  #has_many :public_stores,:through => :users,:class_name => "PublicStore"

  #has_many :public_stores,:foreign_key => "department_id",:class_name => "Category",:conditions => ["cate=?",'public_store']

  CATE = [["一级部门",1],["二级部门",2],["三级部门",3]]

  #所有下级部门，共3级
  def subordinate_departments
    result = self.children
    self.children.each do |d|
      result += d.children
      d.children.each do |d|
        result += d.children
      end
    end
    result.uniq!
    result
  end


end
