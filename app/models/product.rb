# encoding: utf-8
class Product < ActiveRecord::Base
  # attr_accessible :title, :body


  include SetCreatedUser
  include CustomAssociationMethod

  CATE=[["产品",0],["服务",1]]

  belongs_to :category

  before_create :set_data1


  has_many :develop_steps,:as => :develop_step_resource

  def cate_text
    CATE[self.cate].first
  end

  private

  def set_data1
    count_num = Product.count + 1
    num = 6-count_num.to_s.length
    self.number = "0"*num + count_num.to_s
  end


end
