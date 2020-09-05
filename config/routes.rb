Rails.application.routes.draw do
  get 'restaurants/index'
  root to: "restaurants#index"

  resources :restaurants, only: [:index, :new, :create, :show, :edit]
end
