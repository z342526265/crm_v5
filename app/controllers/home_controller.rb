# encoding: utf-8
class HomeController < ApplicationController

  def index
    @check_items = @current_user.check_items.includes(:check_resource).where("is_checked=0").group_by{|c|c.check_resource_type} rescue []
    @contact_reminds = @current_user.contact_reminds.where("is_reminded=?",false) rescue []
  end

  def order_show
    @check_item = CheckItem.find(params[:id])
    @check_resource = @check_item.check_resource
    if @check_resource.class_name == "Order"
      @order = @check_resource
    elsif @check_resource.class_name == "OrderItem"
      @order_item = @check_resource
      @order = @order_item.order
    end
    render :partial=>"/orders/ajax_show"
  end








  def main_menu
    render :partial => "/layouts/main_menu"
  end

  def blank_action
    render :nothing => true,:layout=>false
  end

end
