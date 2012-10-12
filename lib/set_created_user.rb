# encoding: utf-8
module SetCreatedUser

  def self.included(base)
    base.belongs_to :created_user,:foreign_key => "created_user_id",:class_name => "User"
    base.before_create :set_created_user
  end

   def set_created_user
     self.created_user = User.current
   end

end