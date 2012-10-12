class AddColumnsToMiniClients < ActiveRecord::Migration
  puts "+++++++++"
  def change
    add_column :mini_clients, :serve_due_time_first, :date
    add_column :mini_clients, :serve_due_time_last, :date

    MiniClient.includes(:orders).each_with_index do |m,i|
      dates = m.order_items.map{|item|item.serve_end_at}
      if dates.present?
        m.update_attribute(:serve_due_time_first,dates.min)
        m.update_attribute(:serve_due_time_last,dates.max)
      end
      puts i
    end

  end

end
