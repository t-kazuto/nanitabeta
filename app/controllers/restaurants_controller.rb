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

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurants = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:username, :day, :time, :prefecture_id, :station, :name, :genre, :menu, :price, :image, :remark)
  end

  def save
    Restaurant.create(restaurant_params)
  end
end
