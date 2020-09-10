require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe '投稿機能' do
    before do
      @restaurant = FactoryBot.build(:restaurant, :image)
      @restaurant.image = fixture_file_upload('spec/fixtures/public/images/test_image.jpeg')
    end

    it 'username、day、prefecture_id、station、name、genre、menu、price、imageが存在すれば登録できる' do
      expect(@restaurant).to be_valid
    end

    it 'usernameが空では登録できない' do
      @restaurant.username = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include("Username can't be blank")
    end

    it 'dayが空では登録できない' do
      @restaurant.day = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include("Day can't be blank")
    end

    it 'prefecture_idが空では登録できない' do
      @restaurant.prefecture_id = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include('Prefecture Select')
    end

    it 'stationが空では登録できない' do
      @restaurant.station = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include("Station can't be blank")
    end

    it 'nameが空では登録できない' do
      @restaurant.name = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include("Name can't be blank")
    end

    it 'genreが空では登録できない' do
      @restaurant.genre = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include("Genre can't be blank")
    end

    it 'menuが空では登録できない' do
      @restaurant.menu = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include("Menu can't be blank")
    end

    it 'priceが空では登録できない' do
      @restaurant.price = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include("Price can't be blank")
    end

    it 'imageが空では登録できない' do
      @restaurant.image = nil
      @restaurant.valid?
      expect(@restaurant.errors.full_messages).to include("Image can't be blank")
    end

    it 'timeが存在していなくても登録できる' do
      @restaurant.time = nil
      expect(@restaurant).to be_valid
    end

    it 'remarkが存在していなくても登録できる' do
      @restaurant.remark = nil
      expect(@restaurant).to be_valid
    end
  end
end
