class UpdateLog < ActiveRecord::Base
  # attr_accessible :title, :body

  include SetCreatedUser
  include CustomAssociationMethod

  belongs_to :update_logs_resource, :polymorphic => true
  #belongs_to :created_user,:foreign_key => "created_user_id",:class_name => "User"



end
