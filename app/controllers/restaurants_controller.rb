class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurants = Restaurant.new
  end

  def create
    Restaurant.create(restaurant_params)
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:day, :time, :prefecture_id, :station, :name, :genre, :menu, :price, :image, :remark)
  end
end
