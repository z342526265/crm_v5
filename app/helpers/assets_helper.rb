# encoding: utf-8
module AssetsHelper

  def asset_users
    result = [["闲置资产","0"]]
    User.all.each do |u|
      result << [u.name,u.id]
    end
    result
  end

end
