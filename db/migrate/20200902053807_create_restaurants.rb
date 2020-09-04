class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.date :day, null: false
      t.string :time
      t.integer :prefecture_id, null: false
      t.string :station, null: false
      t.string :name, null: false
      t.string :genre, null: false
      t.string :menu, null: false
      t.integer :price, null: false
      t.string :remark 
      t.timestamps
    end
  end
end
