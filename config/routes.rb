Rails.application.routes.draw do
  root to: "restaurants#index"
  get 'restaurants/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :restaurants  do
   resources :comments, only: :create
   collection do
    get 'search'
   end
  end
  resources :users, only: :show
end
