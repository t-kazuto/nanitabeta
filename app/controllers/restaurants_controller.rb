class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.order("created_at DESC")
  end

  def new
    @restaurants = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:day, :time, :prefecture_id, :station, :name, :genre, :menu, :price, :image, :remark)
  end

  def save
    Restaurant.create(restaurant_params)
  end
end
