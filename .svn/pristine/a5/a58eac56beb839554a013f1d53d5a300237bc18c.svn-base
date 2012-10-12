class PublicStore < ActiveRecord::Base
  # attr_accessible :title, :body

  include SetCreatedUser
  include CustomAssociationMethod

  has_and_belongs_to_many :users
  has_many :mini_clients

  #把个人客户和用户关联起来
  def associate_to_user(department_ids)
    users = User.where("department_id in ?",department_ids)
    self.users = users
  end

end
