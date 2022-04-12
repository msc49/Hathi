class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.boolean :private_room

      t.timestamps
    end
    add_index :chatrooms, :name, unique: true
  end
end
