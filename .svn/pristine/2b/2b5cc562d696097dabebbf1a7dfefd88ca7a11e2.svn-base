class Position < ActiveRecord::Base
  # attr_accessible :title, :body

  include SetCreatedUser
  include CustomAssociationMethod

  belongs_to :department

  #has_many :users,:class_name => 'User',:foreign_key => :position_id

end
