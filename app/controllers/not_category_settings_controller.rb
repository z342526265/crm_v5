# encoding: utf-8
class NotCategorySettingsController < ApplicationController


  #保护客户数量设置,根据角色设置
  def protect_client_count_index
    @roles = Role.where("protect_client_count > 0")
  end

  #添加公海给员工
  def protect_client_count_create
    @select_roles = Role.where("protect_client_count=0")
    return unless request.post?
    return unless params[:role_id]
    @role = Role.find(params[:role_id])
    if @role.update_attributes(:protect_client_count=>params[:protect_client_count])
      redirect_to :action=>"protect_client_count_index"
      flash[:notice] = "设置成功！"
    else
      render "protect_client_count_create"
    end
  end

  #添加公海给员工
  def protect_client_count_update
    @role = Role.find(params[:id])
    return unless request.post?
    if @role.update_attributes(params[:role])
      redirect_to :action=>"protect_client_count_index"
      flash[:notice] = "设置成功！"
    else
      render "protect_client_count_update"
    end
  end



end
