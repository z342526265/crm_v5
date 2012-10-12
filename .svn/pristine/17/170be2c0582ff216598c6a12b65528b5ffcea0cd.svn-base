class AddIsLosedToMiniClients < ActiveRecord::Migration
  def change

    add_column :mini_clients, :is_losed, :boolean,:default=>false   #失效


    MiniClient.where("created_at < ?",Time.now).update_all("is_losed"=>false)


  end
end
