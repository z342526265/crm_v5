class ContactRemind < ActiveRecord::Base
  # attr_accessible :title, :body
  include SetCreatedUser
  include CustomAssociationMethod

  belongs_to :user
  belongs_to :mini_client,:counter_cache => true

end
