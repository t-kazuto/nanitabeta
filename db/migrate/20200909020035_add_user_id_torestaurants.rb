class AddUserIdTorestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :user_id, :integer, null: false
  end
end
