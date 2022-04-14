class AddOnlinestatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :onlinestatus, :boolean, default: true
  end
end
