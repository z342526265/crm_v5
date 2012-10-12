class StatisticsController < ApplicationController

  #before_filter :statistics_users


  def serve
    statistics_users(4)
    @statistics = ServeStatistics.select_statistics(@users,params[:start_at],params[:end_at])
    if request.xhr?
      if params[:cate] == "serve_record"
        @serve_records = params[:ty1] == "2" ? @statistics.first.contact_serve_records.limit(50).order(:mini_client_id) : @statistics.first.serve_records.limit(50).order(:mini_client_id)
        render :partial=>"/statistics/serve_records_table"
      else
        render :partial=>"/statistics/ajax_serve"
      end
    else
      render :template => "/statistics/statistics"
    end
  end


  def sell
    statistics_users(2)
    @statistics = SellStatistics.select_statistics(@users,params[:start_at],params[:end_at])
    if request.xhr?
      render :partial=>"/statistics/ajax_sell"
    else
      render :template => "/statistics/statistics"
    end
  end



  private
  def statistics_users(department_id)
    @users = params[:user_id].present? ? User.where("id=?",params[:user_id]) : User.where("department_id = ?",department_id).subordinate_users(@current_user)
  end

  #def statistics_serves
  #end

end
