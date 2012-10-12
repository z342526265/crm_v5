class AddColumnsToDevelopSteps < ActiveRecord::Migration
  def change
    add_column :develop_steps, :client_name, :string

    DevelopStep.order_develop_steps.each do |step|
      client_name = step.order.mini_client.name
      step.update_attribute(:client_name,client_name)
    end

  end
end
