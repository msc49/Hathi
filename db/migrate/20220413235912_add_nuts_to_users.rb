class AddNutsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nuts, :bigint, default: 0
  end
end
