class Restaurant < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  with_options presence: true do
    validates :username
    validates :day
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :station
    validates :name
    validates :genre
    validates :menu
    validates :price
    validates :image
  end
end
