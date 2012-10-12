# encoding: utf-8
class CategoriesController < ApplicationController


  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.where("cate=?",params[:cate])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new(:cate=>params[:cate])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html do
          redirect_to :action=>"index",:cate=>params[:category][:cate]
          flash[:notice] = '创建成功.'
        end
        #format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html do
          redirect_to :action=>"index",:cate=>params[:category][:cate]
          flash[:notice] = '更新成功.'
        end
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to :back
  end

  def ajax_result
    @introduce_products = Product.select("name").find_all_by_cate(0)
    @introduce_servers = Product.select("name").find_all_by_cate(1)
    @interest_points = Category.select("name").find_all_by_cate("interest_point")
    @dissent_points = Category.select("name").find_all_by_cate("dissent_point")
    @invalid_contact_description = Category.select("name").find_all_by_cate("invalid_contact_description")
    result = [@introduce_products,@introduce_servers,@interest_points,@dissent_points,@invalid_contact_description].to_json
    respond_to do |format|
      format.json { render json: result}
    end
  end

  def ajax_result_serve_record
    @invalid_contact_description = Category.select("name").find_all_by_cate("invalid_contact_description")
    respond_to do |format|
      format.json { render json: @invalid_contact_description}
    end
  end

  #ajax返回屏蔽字段
  def ajax_shield_field
    #@shield_fields = Category.find_all_by_cate("shield")
    #render :json=>@shield_fields
  end


  #保护时间设置
  def update_protect_time
    @protect_time = ProtectTime.find(params[:id])
    return unless request.post?
    if @protect_time.update_attributes(params[:protect_time])
      redirect_to :action=>"protect_time_index"
      flash[:notice] = "更新成功！"
    end
  end

  #保护时间设置列表
  def protect_time_index
    @protect_times = ProtectTime.all
  end


  private


end

