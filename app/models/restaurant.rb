class Restaurant < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  with_options presence: true do
    validates :day
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :station
    validates :name
    validates :genre
    validates :menu
    validates :price
  end
end
