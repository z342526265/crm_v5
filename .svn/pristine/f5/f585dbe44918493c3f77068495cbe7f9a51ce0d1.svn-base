# encoding: utf-8
class PositionsController < ApplicationController


  before_filter :find_department

  def index
    @positions = @department.positions.page(params[:page]).per(3)
  end

  def show
    @position = @department.positions.find( params[:id] )
  end

  def new
    @position = @department.positions.build
  end

  def create
    @position = @department.positions.build( params[:position] )
    if @position.save
      redirect_to :controller=>"positions",:action=>"index",:department_id=>@department
    else
      render :action => :new
    end
  end

  def edit
    @position = @department.positions.find( params[:id] )
  end

  def update
    @position = @department.positions.find( params[:id] )

    if @position.update_attributes( params[:position] )
      redirect_to :controller=>"positions",:action=>"index",:department_id=>@department
    else
      render :action => :new
    end

  end

  def destroy

    @position = @department.positions.find( params[:id] )
    if @position.destroy
      redirect_to :controller=>"positions",:action=>"index",:department_id=>@department
      flash[:notice] = "删除成功！"
    else
      flash[:alert] = "未成功！"
    end


  end

  protected

  def find_department
    @department = Department.find( params[:department_id] )
  end



end
