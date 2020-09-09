Rails.application.routes.draw do
  root to: "restaurants#index"
  get 'restaurants/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :restaurants, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
