class Stock < ActiveRecord::Base
  #attr_accessible :asset_id, :purchase_date, :user_id


  include SetCreatedUser
  include CustomAssociationMethod

  belongs_to :asset
  belongs_to :user
  belongs_to :purchase_user,:foreign_key => "purchase_user_id",:class_name => "User"
  belongs_to :purchase_way,:foreign_key => "purchase_way_id",:class_name => "Category"

  belongs_to :purchase_stock,:foreign_key => "parent_id",:class_name => "Stock"
  has_many :used_stock,:foreign_key => "parent_id",:class_name => "Stock"


  before_save :set_parent_used_count,:set_remained_count

  #设置 采购的库存中已经领用的数量
  def set_parent_used_count
    if self.parent_id.present?
      self.purchase_stock.used_count += self.used_count
      self.purchase_stock.save
    end
  end
  def set_remained_count
    if self.parent_id.blank?
      self.remained_count = self.purchase_count - self.used_count
    end
  end





end
