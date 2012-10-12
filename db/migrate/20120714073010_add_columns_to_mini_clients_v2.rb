class AddColumnsToMiniClientsV2 < ActiveRecord::Migration
  def change
    add_column :mini_clients, :contact_people_count, :integer,:default=>0
    add_column :mini_clients, :contact_records_count, :integer,:default=>0
    add_column :mini_clients, :contact_reminds_count, :integer,:default=>0
    add_column :mini_clients, :serve_records_count, :integer,:default=>0
    add_column :mini_clients, :visit_home_records_count, :integer,:default=>0
    add_column :mini_clients, :update_news_records_count, :integer,:default=>0


    MiniClient.reset_column_information
    MiniClient.find_each do |u|
      MiniClient.reset_counters u.id, :contact_people
      MiniClient.reset_counters u.id, :contact_records
      MiniClient.reset_counters u.id, :contact_reminds
      MiniClient.reset_counters u.id, :serve_records

      u.update_attribute( :visit_home_records_count, u.visit_home_records.count)
      u.update_attribute( :update_news_records_count, u.update_news_records.count)
      puts u.id
    end


  end
end
