class UsersController < ApplicationController
  def show
    @username = current_user.username
    @restaurants = current_user.restaurants
  end
end
