class SellStatistics


  # 销售统计的构造函数
  def initialize(user,start_at=Date.today - 1.weeks,end_at = Date.today)

    @user = user

    #把传入的到期时间加一，这样可以统计当天的
    end_at = end_at.to_date + 1.day


    #联系记录
    @contact_records = @user.contact_records.where("contact_records.created_at >= ? and contact_records.created_at <= ?",start_at,end_at)

    #联系记录总数
    @contact_total_count = @contact_records.length

    #电话联系总数
    @tel_contact_count = @contact_records.select{|s|s.contact_way_id == 10}.length

    #上门拜访数
    @visit_count = @contact_records.select{|s|s.contact_way_id == 11}.length

    #客户来访
    @come_count = @contact_records.select{|s|s.contact_way_id == 21}.length

    #其他联系方式
    @other_way_count = @contact_records.select{|s|![10,11,21].include? s.contact_way_id}.length

    #当前用户所有服务的客户
    @mini_clients = @user.mini_clients

    #客户总数量
    @mini_clients_total_count = @mini_clients.length

    #新签订单数量
    @create_orders_count = @user.orders.where("created_at >= ? and created_at <= ?",start_at,end_at).count

  end


  attr_reader :user,:other_way_count,:contact_total_count,:tel_contact_count,:visit_count,:come_count,
              :mini_clients_total_count,:create_orders_count


  def self.select_statistics(users,start_at=Date.today - 1.weeks,end_at = Date.today)
    start_at = start_at || Date.today - 1.weeks
    end_at = (end_at.blank? || end_at.to_date > Date.today) ? Date.today : end_at
    users.map{|u|self.new(u,start_at,end_at)}
  end


end