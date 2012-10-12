# encoding: utf-8
class UsersController < ApplicationController
  before_filter :find_user,:only=>[:edit,:update,:show,:lock,:unlock,:basic_information,:family_information,:position_information]
  def index
    @users = User.subordinate_users(@current_user).page(params[:page]).per(@every_page_count)
  end

  def new
    if @current_user.is_administrator?
      @roles = Role.where(:cate=>[0,1,2])
    elsif @current_user.roles.any?{|r|r.cate>1}
      @roles = Role.where(:cate=>[0,1,2])
    else
      @roles = Role.where(:cate=>0)
    end
    @user = User.new
  end

  def create
    if @current_user.is_administrator?
      @roles = Role.where(:cate=>[0,1,2])
    else
      @roles = Role.where(:cate=>0)
    end

    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User #{@user.name} 创建成功！."
      redirect_to(:action=>'index')
    else
      render :action => "new"
    end
  end


  def show
  end

  def edit
    if @current_user.is_administrator?
      @roles = Role.where(:cate=>[0,1,2])
    elsif @current_user.roles.any?{|r|r.cate>1}
      @roles = Role.where(:cate=>[0,1,2])
    else
      @roles = Role.where(:cate=>0)
    end
  end

  def update
    if @current_user.is_administrator?
      @roles = Role.where(:cate=>[0,1,2])
    else
      @roles = Role.where(:cate=>0)
    end
    if @user.update_attributes(params[:user])
      redirect_to :controller => "users",:action=>"show",:id=>@user
      flash[:notice]='信息成功被更新.'
    else
      render :action => "edit"
    end
  end

  def unlock
    if @user.update_attribute(:is_lock,false)
      flash[:notice] = "#{@user.name} 账户已经解锁！"
    else
      flash[:alert] = "解锁失败,请重试！"
    end
    redirect_to :back
  end

  def lock
    if @user.update_attribute(:is_lock,true)
      flash[:notice] = "#{@user.name} 账户已经锁定！"
    else
      flash[:alert] = "锁定失败，请重试！"
    end
    redirect_to :back
  end

  def basic_information
    return unless request.put?
    if @user.update_attributes(params[:user])
      redirect_to :controller=>"users",:action=>"show",:id=>@user
      flash[:notice] = "信息更新成功！"
    else
      render action: "basic_information"
    end
  end

  def family_information
    return unless request.put?
    if @user.update_attributes(params[:user])
      redirect_to :controller=>"users",:action=>"show",:id=>@user
      flash[:notice] = "信息更新成功！"
    else
      render action: "family_information"
    end
  end

  def position_information
    if @current_user.is_administrator?
      @roles = Role.where(:cate=>[0,1,2])
    else
      @roles = Role.where(:cate=>0)
    end
    return unless request.put?
    if @user.update_attributes(params[:user])
      redirect_to :controller=>"users",:action=>"show",:id=>@user
      flash[:notice] = "信息更新成功！"
    else
      render action: "position_information"
    end
  end


  #账号修改
  def update_account
    return if request.get?
    find_user
    @admin = User.find_by_cate(3*1415926)
    expected_password = User.encrypted_password(params[:admin_password], @admin.salt)
    if @admin.hashed_password != expected_password
      flash[:alert] = "管理员密码不正确！"
      return
    elsif params[:new_password] != params[:new_password_confirmation] || params[:old_login] != @user.login
      flash[:alert] = "两次输入的密码不匹配，或者要修改的用户名不匹配！"
      return
    else
      @user.login = params[:new_login]
      @user.password = params[:new_password]
      @user.password_confirmation = params[:new_password]
      if @user.save!
        redirect_to :controller=>"users",:action=>"index"
      end

    end
  end


  private
  def find_user
    @user = User.find(params[:id])
  end
end
