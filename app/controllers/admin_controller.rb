# encoding: utf-8
class AdminController < ApplicationController

  layout false, :only=>[:login]


  def login
    if @current_user
      redirect_to :root
      return false
    end
    if request.post?
      user = User.authenticate(params[:login], params[:password])
      if user
        if user.is_lock
          flash.now[:alert] = "该账号已经锁定，不能使用！"
        else
          session[:user_id] = user.id
          redirect_to :root
        end
      else
        flash.now[:alert] = "无效的用户名或密码！"
      end
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "已经退出！"
    redirect_to :action=>"login"
  end

  def edit_password
    @current_user = User.find(session[:user_id]) if session[:user_id]
    #User.current = @current_user
    @current_public_stores = @current_user.public_stores
    #@every_page_count = 50

    redirect_to :action=>"login" unless @current_user
    if request.post?
      if params[:password] != params[:password_confirmation]
        redirect_to :back
        flash[:alert] = "两次输入的密码不匹配！"
        return
      end
      return unless params[:old_password]
      expected_password = User.encrypted_password(params[:old_password], @current_user.salt)
      if @current_user.hashed_password != expected_password
        redirect_to :back
        flash[:notice] = "原密码不正确！"
      else
        @current_user.update_attribute(:password,params[:password])
        session[:user_id] = nil
        redirect_to :action=>"login"
        flash[:notice] = "密码修改成功，请重新登陆！"
      end
    end
  end

  def permission_error
    @current_user = User.find(session[:user_id]) if session[:user_id]
    set_basic_data
    #User.current = @current_user
  end


  def check_permission
  end

end
