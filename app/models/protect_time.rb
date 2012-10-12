# encoding: utf-8
class ProtectTime < ActiveRecord::Base
  # attr_accessible :title, :body

  include SetCreatedUser
  include CustomAssociationMethod

  #CATE = [["公海客户",0],["电话客户",1],["保护客户",2],["成单客户",3],["自己录入",4]]

  CATE = {"created"=>"我创建的","tel"=>"电话客户","protected"=>"保护客户"}

  def self.[](cate)
    ProtectTime.find_by_cate(cate).time_length
  end

end
