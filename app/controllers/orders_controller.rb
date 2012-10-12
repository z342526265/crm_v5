# encoding: utf-8
class OrdersController < ApplicationController

  def index
    if params[:search_number_like].present?
      @orders = Order.includes(:order_items).where("orders.number like ?","%"+params[:search_number_like]).page(params[:page]).per(@every_page_count)
    else
      @orders = Order.includes(:order_items).page(params[:page]).per(@every_page_count)
    end
    @number_like = params[:search_number_like]
  end

  def create
    @mini_client = MiniClient.find(params[:mini_client_id])
    @products = Product.all
    if  request.get?
      @order = @mini_client.orders.build({:created_user_id=>@current_user.id})
      @contact_people = @mini_client.contact_people
    else
      @order = @mini_client.orders.build(params[:order])
      result = true
      begin
        ActiveRecord::Base.transaction do
          @order.save!
          OrderItem.custom_build(@order,params[:order_items])
          @mini_client.update_attribute(:status_num,4)
        end
      rescue
        result = false
      end
      if result
        redirect_to :controller => "mini_clients",:action=>"my_serve_clients"
      else
        redirect_to :back
        flash[:alert] = "产品不能为空！"
      end
    end
  end

  def ajax_show
    @order = Order.includes(:order_items).find(params[:id])
    render :partial=>"/orders/ajax_show"
  end

  def ajax_index
    @orders = Order.includes(:order_items).all
    render :partial => "orders/ajax_index"
  end

  def ajax_apply_destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "删除成功！"
    redirect_to :back
  end

  #申请修改订单
  def ajax_apply_update
    @order = Order.find(params[:id])
    @mini_client = @order.mini_client
    @products = Product.all
    @contact_people = @mini_client.contact_people
    if request.get?
      render :partial => "ajax_update"
    else
      ActiveRecord::Base.transaction do
        @check_item = @order.check_items.build(
            :cate=>1,
            :attrs=>{:order_items_attributes=>@order.order_items_attributes,:description=>@order.description,:contact_person_id=>@order.contact_person_id},
            :name=>"【#{@current_user.name}】修改了订单【#{@order.number}】",
            :description=>"修改人：【#{@current_user.name}】，订单编号：【#{@order.number}】",
            :users => Permission.find_by_cate(31).users
        )
        @check_item.save
        check_hash = {:check_status => @order.check_status == 2 ? 1 : 3}
        @order.update_attributes(params[:order].merge(check_hash))
      end
      order_show_index
      render :partial => "/mini_clients/ajax_show/order/order_index"
    end
  end


  def ajax_create
    @mini_client = MiniClient.find(params[:mini_client_id])
    @products = Product.all
    if request.get?
      @order = @mini_client.orders.build({:created_user_id=>@current_user.id})
      @contact_people = @mini_client.contact_people
      render :partial => "/mini_clients/ajax_show/order/ajax_create"
    else
      #params[:order] = params[:order].update({:check_status =>1})
      @order = @mini_client.orders.build(params[:order].merge(:check_status => 1))
      ActiveRecord::Base.transaction do
        @order.save
        OrderItem.custom_create(@order,params[:order_items])
        @check_item = @order.check_items.build(
            :cate=>0,
            :attrs=>{:check_status=>0},
            :name=>"【#{@current_user.name}】为客户【#{@mini_client.name}】新建了订单",
            :description=>"【#{@current_user.name}】为客户【#{@mini_client.name}】新建了订单，订单编号为【#{@order.number}】！"
        )
        @check_item.save
        @check_item.users = Permission.find_by_cate(31).users
      end
      order_show_index
      render :partial => "/mini_clients/ajax_show/order/order_index"
    end
  end

  #取消订单新建
  def ajax_cancel_create
    @order = Order.find(params[:id])
    @mini_client = @order.mini_client
    @order.destroy
    order_show_index
    render :partial => "/mini_clients/ajax_show/order/order_index"
  end

  #取消订单修改
  def ajax_cancel_update
    @order = Order.find(params[:id])
    @mini_client = @order.mini_client
    #active_check_item = @order.active_check_item
    @order.update_attributes(:check_status=>0)
    order_show_index
    render :partial => "/mini_clients/ajax_show/order/order_index"
  end

  #
  ##修改订单，订单项
  #def ajax_update_order_item
  #  @mini_client = MiniClient.find(params[:mini_client_id])
  #  @contact_people = @mini_client.contact_people
  #  @order_item = OrderItem.find(params[:order_item_id])
  #  @order = @order_item.order
  #  if request.get?
  #    @products = Product.all
  #    render :partial => "/mini_clients/ajax_show/order/ajax_update_order_item"
  #  else
  #    change_text = @order_item.change_text(params[:order_item],params[:order])
  #    #params[:order]
  #    #pp "=============="
  #    if change_text.present?
  #      ActiveRecord::Base.transaction do
  #        #更新订单的描述信息，并把状态更改为修改审核中
  #        @order.update_attributes(params[:order].merge(:check_status=>2))
  #        #创建审核对象
  #        @check_item = @order_item.check_items.build(
  #            :attrs=>params[:order_item],
  #            :name=>"【#{@current_user.name}】修改了订单【#{@order.number}】中产品【#{@order_item.product_name}】的信息",
  #            :description=>"【#{change_text}】"
  #        )
  #        @check_item.save
  #        @check_item.users = Permission.find_by_cate(31).users
  #      end
  #      order_show_index
  #      render :partial => "/mini_clients/ajax_show/order/order_index"
  #    else
  #      render :text => "failed"
  #    end
  #
  #  end
  #end

  #订单相关审核
  def check

    @check_item = CheckItem.find(params[:id])
    @check_resource = @check_item.check_resource
    if @check_resource.class_name == "Order"
      @order = @check_resource
    elsif @check_resource.class_name == "OrderItem"
      @order_item = @check_resource
      @order = @order_item.order
    end

    #@order = @check_item.check_resource
    @mini_client = @order.mini_client
    if request.get?
      if params[:cate] == "home"
        render :partial=>"/home/check"
      else
        render :partial=>"/shared/check/check"
      end
    else
      check_info = params[:check_item][:check_info]

      # @check_item.cate == 0 说明是新建订单类型的
      # @check_item.cate == 1 说明是修改订单类型的
      # @check_item.cate == 2 说明是删除订单类型的
      ActiveRecord::Base.transaction do
        case @order.check_status

          #审核状态时1，表示新建订单审核
          when 1
            if params[:commit] == "通过"
              attrs = params[:check_item].merge(:checked_user_id=>@current_user.id,:is_checked=>true,:is_approval=>true)
              @check_item.update_attributes(attrs)
              @mini_client.update_attribute(:status_num,4) if @mini_client.status_num != 4
              @order.update_attributes(:check_status=>0,:check_info=>check_info)
            elsif params[:commit] == "驳回"
              attrs = params[:check_item].merge(:checked_user_id=>@current_user.id,:is_checked=>true,:is_approval=>false)
              @check_item.update_attributes(attrs)
              @order.update_attributes(:check_status=>2,:check_info=>check_info)
            end

          #2，表示修改订单审核
          when 3
            if params[:commit] == "通过"
              attrs = params[:check_item].merge(:checked_user_id=>@current_user.id,:is_checked=>true,:is_approval=>true)
              @check_item.update_attributes(attrs)
              #@mini_client.update_attribute(:status_num,4) if @mini_client.status_num != 4
              @order.update_attributes(:check_status=>0,:check_info=>check_info)
            elsif params[:commit] == "驳回"
              attrs = params[:check_item].merge(:checked_user_id=>@current_user.id,:is_checked=>true,:is_approval=>false)
              @check_item.update_attributes(attrs)
              @order.update_attributes({:check_status=>4,:check_info=>check_info}.merge(@check_item.attrs))
            end

          #5，付欠款之后审核
          when 5
            if params[:commit] == "通过"
              attrs = params[:check_item].merge(:checked_user_id=>@current_user.id,:is_checked=>true,:is_approval=>true)
              @check_item.update_attributes(attrs)
              @order_item.received_amount += @check_item.attrs[:received_amount].to_i
              @order_item.save
              @order.update_attributes(:check_status=>0,:check_info=>check_info)
            elsif params[:commit] == "驳回"
              PaidItem.destroy(@check_item.attrs[:paid_item_id])
              attrs = params[:check_item].merge(:checked_user_id=>@current_user.id,:is_checked=>true,:is_approval=>false)
              @check_item.update_attributes(attrs)
              @order.update_attributes({:check_status=>0,:check_info=>check_info})
            end

          #6，增加续费之后审核
          when 6
            if params[:commit] == "通过"
              @renew_fee = @order_item.renew_fees.create(@check_item.attrs.merge(:created_user_id=>@check_item.created_user_id))
              attrs = params[:check_item].merge(:checked_user_id=>@current_user.id,:is_checked=>true,:is_approval=>true)
              @check_item.update_attributes(attrs)
              @order.update_attributes(:check_status=>0,:check_info=>check_info)
            elsif params[:commit] == "驳回"
              attrs = params[:check_item].merge(:checked_user_id=>@current_user.id,:is_checked=>true,:is_approval=>false)
              @check_item.update_attributes(attrs)
              @order.update_attributes({:check_status=>0,:check_info=>check_info})
            end
        end
      end
      @mini_client = @order.mini_client
      if params[:cate] == "home"
        render :js=>"alert('审核完成！');$('#sk').remove();$('#check_item_tr_#{@check_item.id}').remove();"
      else
        order_show_index
        render :partial => "/mini_clients/ajax_show/order/order_index"
      end
    end
  end


  #增加付款项
  def add_paid_item
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @mini_client = @order.mini_client

    ActiveRecord::Base.transaction do
      @paid_item= @order_item.paid_items.create(params[:paid_item])
      @check_item = @order_item.check_items.create(
          :cate=>2,
          :attrs=>{:received_amount=>params[:paid_item][:received_amount],:paid_item_id=>@paid_item.id},
          :name=>"订单【#{@order.number}】增加了付款",
          :description=>"付欠款数量为：【#{params[:paid_item][:received_amount]}】"
      )
      @order.update_attribute(:check_status,5)
      @check_item.users = Permission.find_by_cate(31).users
    end
    order_show_index
    render :partial => "/mini_clients/ajax_show/order/order_index"
  end


  #增加续费
  def add_renew_fee
    @order_item = OrderItem.find(params[:order_item_id])
    @order = @order_item.order
    @mini_client = @order.mini_client
    if request.post?
      ActiveRecord::Base.transaction do
        #@renew_fee = @order_item.renew_fees.create(params[:renew_fee])
        @check_item = @order_item.check_items.create(
            :cate=>2,
            :attrs=>params[:renew_fee],
            :name=>@current_user.name,
            :description=>"续费【#{params[:renew_fee][:fee_amount]}】元,续费后服务时间为【#{params[:renew_fee][:serve_end_at]}】。"
        )
        @order.update_attribute(:check_status,6)
        @mini_client.update_attribute("is_losed",false) if @mini_client.is_losed?
        @check_item.users = Permission.find_by_cate(31).users
      end
    end
    order_show_index
    render :partial => "/mini_clients/ajax_show/order/order_index"
  end



  private

  def order_show_index
    @order_items = @mini_client.order_items.includes(:order).where('orders.check_status = ?',0).group_by{|item|item.order}
    @checking_orders = @mini_client.orders.includes(:order_items).where("check_status != ?",0)
  end

end
