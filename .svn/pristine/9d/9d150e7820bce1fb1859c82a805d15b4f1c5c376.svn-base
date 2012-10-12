# encoding: utf-8
class SuppliersController < ApplicationController

  def index
    @search = Supplier.all.search(params[:search])
    @suppliers = @search.page(params[:page]).per(@every_page_count)   # load all matching records
  end

  def show

      @mini_client = Supplier.find(params[:id])
      render :partial => "mini_clients/show",:locals => {:client=>@mini_client}
  end


  def create
    @supplier = Supplier.new(params[:supplier])
    if request.get?
      render :template => "/suppliers/create"
    else
      if @supplier.save
        redirect_to :action=>"index"
        flash[:notice] = "新建成功！"
      else
        render :template => "/suppliers/create"
      end
    end
  end

  def update
    @supplier = Supplier.find(params[:id])
    if request.xhr?
      if @supplier.update_attributes(params[:supplier])
        render :js=>"alert('分配成功！');"
      else
        render :js=>"alert('未成功,请刷新重试！');"
      end
    else
      if request.get?
        render :template => "/suppliers/update"
      else
        if @supplier.update_attributes(params[:supplier])
          redirect_to :action=>"index"
          flash[:notice] = "编辑成功！"
        else
          render :template => "/suppliers/update"
        end
      end
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    if @supplier.destroy
      redirect_to :back
      flash[:notice] = "删除成功！"
    end
  end



end
