# encoding: utf-8
class ServeStatistics

  #构造函数
  def initialize(user,start_at=Date.today - 1.weeks,end_at = Date.today)
    #如果查询的后一个时间大于今天，则只统计到今天

    #把传入的到期时间加一，这样可以统计当天的
    end_at = end_at.to_date + 1.day

    @user = user

    @serve_records = @user.serve_records.where("created_at >= ? and created_at <= ?",start_at,end_at)

    #总数
    @serve_total_count = @serve_records.count
    #维护数
    @preserve_count = @serve_records.select{|s|s.contact_way_id == 27}.count
    #@preserve_count = @serve_records.where("contact_way_id = 27").count
    #上门拜访数
    #@visit_count = @serve_records.select{|s|s.contact_way_id == 26}.length
    @visit_count = @serve_records.where("contact_way_id = 26").count
    #客户来访
    #@come_count = @serve_records.select{|s|s.contact_way_id == 29}.length
    @come_count = @serve_records.where("contact_way_id = 29").count

    #@contact_serve_records = @serve_records.select{|s|[24,25,28].include? s.contact_way_id}
    @contact_serve_records = @serve_records.where("contact_way_id in (24,25,28)")
    @contact_count = @contact_serve_records.count

    #当前用户所有服务的客户
    @mini_clients = @user.serve_mini_clients

    #客户总数量
    @mini_clients_total_count = @mini_clients.count
    #流失的客户数量
    #@leave_mini_clients_count = @mini_clients.where("serve_due_time_first != ?",nil).select{|c|c.serve_due_time_first >= start_at && c.serve_due_time_first <= end_at}.length
    @leave_mini_clients_count = @mini_clients.where("serve_due_time_first >= ? and serve_due_time_first <= ?",start_at,end_at).count
    #订单续费数量
    @renew_fees_count = @user.renew_fees.where("created_at >= ? and created_at <= ?",start_at,end_at).count
    #新签订单数量
    @create_orders_count = @user.orders.where("created_at >= ? and created_at <= ?",start_at,end_at).count

  end


  attr_reader :user,:contact_count,:serve_total_count,:preserve_count,:visit_count,:come_count,
              :mini_clients_total_count,:serve_records,:contact_serve_records,
              :leave_mini_clients_count,:renew_fees_count,:create_orders_count

  def self.select_statistics(users,start_at=Date.today - 1.weeks,end_at = Date.today)
    start_at = start_at || Date.today - 1.weeks
    end_at = (end_at.blank? || end_at.to_date > Date.today) ? Date.today : end_at
    users.map{|u|ServeStatistics.new(u,start_at,end_at)}
  end


end