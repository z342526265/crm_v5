# encoding: utf-8
class AssetsController < ApplicationController

  def index
    asset_cate_id = Category.find_by_cate_and_level("asset_cate",1).id rescue ""
    if params[:search]
      params[:search][:asset_cate_id_not_eq] = asset_cate_id if params[:search][:asset_cate_id_eq].blank?
    else
      params[:search] = {}
      params[:search][:asset_cate_id_not_eq] = asset_cate_id
    end
    if params[:search] && params[:search][:user_id_eq] == "0"
      params[:search].delete("user_id_eq")
      @search = Asset.search(params[:search])
      @assets = @search.where("user_id is null")
    else
      @search = Asset.search(params[:search])
      @assets = @search.all   # load all matching records
    end
  end

  def create
    @asset = Asset.new(params[:asset])
    if request.get?
      render :template => "/assets/create"
    else
      if @asset.save
        redirect_to :action=>"index"
        flash[:notice] = "新建成功！"
      else
        render :template => "/assets/create"
      end
    end
  end

  def update
    find_asset
    if request.xhr?
      if @asset.update_attributes(params[:asset].merge(:used_date=>Date.today))
        #render :js=>"alert('分配成功！');"
        render :partial=>"index_tr",:locals => {:asset=>@asset}
      else
        render :js=>"alert('未成功,请刷新重试！');"
      end
    else
      if request.get?
        render :template => "/assets/update"
      else
        if @asset.update_attributes(params[:asset])
          redirect_to :action=>"index"
          flash[:notice] = "编辑成功！"
        else
          render :template => "/assets/update"
        end
      end
    end
  end

  def show
    find_asset
    @update_logs = @asset.update_logs
    render :partial => "show"
  end


  def destroy
    find_asset
    if @asset.destroy
      redirect_to :back
      flash[:notice] = "删除成功！"
    end
  end

private
  def find_asset
    @asset = Asset.find(params[:id])
  end


end
