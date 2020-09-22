class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result(distinct: true).order('created_at DESC')
  end

  def new
    @restaurant = Restaurant.new
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
    @comment = Comment.new
    @comments = @restaurant.comments.includes(:user)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
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

  def search
    @q = Restaurant.search(params[:keyword])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:username, :day, :time, :prefecture_id, :station, :name, :genre, :menu, :price, :image, :remark).merge(user_id: current_user.id)
  end

  def save
    Restaurant.create(restaurant_params)
  end
end
