class AddUsernameToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :username, :string, null: false
  end
end
