Rails.application.routes.draw do
  devise_for :users
  get 'restaurants/index'
  root to: "restaurants#index"

  resources :restaurants, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
