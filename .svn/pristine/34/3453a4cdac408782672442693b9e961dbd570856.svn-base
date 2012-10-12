# encoding: utf-8
class StocksController < ApplicationController

  def index
    #pp params
    #pp "========"
    @search = Stock.search(params[:search])

    if params[:cate] == "use"
      @stocks = @search.where("parent_id is not null")
      render :template => "/stocks/used_index"
    else
      @stocks = @search.where("parent_id is null")   # load all matching records
      render :template => "/stocks/index"
    end
  end

  def create
    @stock = Stock.new(params[:stock])
    if request.get?
      render :template => "/stocks/create"
    else
      if @stock.save
        redirect_to :action=>"index"
        flash[:notice] = "新建成功！"
      else
        render :template => "/stocks/create"
      end
    end
  end

  def update
    find_stock
    #if request.xhr?
    #  if @stock.update_attributes(params[:stock])
    #    render :js=>"alert('分配成功！');"
    #  else
    #    render :js=>"alert('未成功,请刷新重试！');"
    #  end
    #else
    if request.get?
      render :template => "/stocks/update"
    else
      if @stock.update_attributes(params[:stock])
        redirect_to :action=>"index"
        flash[:notice] = "编辑成功！"
      else
        render :template => "/stocks/update"
      end
    end
    #end
  end

  def destroy
    find_stock
    if @stock.used_count != 0
      redirect_to :back
      flash[:alert] = "已经有人领用了该物品，不能删除。"
    else
      if @stock.destroy
        redirect_to :back
        flash[:notice] = "删除成功！"
      end
    end
  end

  #领用物品
  def use
    find_stock
    @used_stock = @stock.used_stock.build
    unless request.post?
      render :partial => "use"
    else
      @used_stock = @stock.used_stock.build(params[:used_stock].merge(:asset_id=>@stock.asset_id))
      if @used_stock.save
        @stock.reload
        render :json=>[@stock.remained_count,@stock.used_count]
      else
        render :js=>"alert('未成功！');"
      end
    end
  end


  private
  def find_stock
    @stock = Stock.find(params[:id])
  end


end
