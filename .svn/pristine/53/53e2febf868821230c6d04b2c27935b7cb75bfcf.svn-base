class ProductDevelopStepsController < ApplicationController

  before_filter :find_product,:except => :index
  before_filter :find_develop_step,:except => [:index,:create]

  def index

  end

  def create
    @develop_step = @product.develop_steps.build(params[:develop_step])
    if request.get?
      respond_to do |format|
        format.html { render :partial => "/product_develop_steps/develop_step_form_tr"}
      end
    else
      respond_to do |format|
        if @develop_step.save
          format.html { render :partial => "/product_develop_steps/develop_step_index_tr",:locals => {:product=>@product,:step=>@develop_step,:i=>@product.develop_steps.count}}
        end
      end
    end
  end


  def update
    if request.get?
      render :nothing => true
    else
      pp params

      #respond_to do |format|
        if @develop_step.update_attributes(params[:develop_step])
          render :json=>[@develop_step.name,@develop_step.standard_period]
          #format.html { render :partial => "/product_develop_steps/develop_step_index_tr",:locals => {:product=>@product,:step=>@develop_step,:i=>@product.develop_steps.count}}
        end
      #end

    end

  end


  def destroy

  end

  private
  def find_product
    @product = Product.find(params[:product_id])
  end
  def find_develop_step
    @develop_step = @product.develop_steps.find(params[:develop_step_id])
  end


end
