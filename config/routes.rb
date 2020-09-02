Rails.application.routes.draw do
  get 'restaurants/index'
  root to: "restaurants#index"
end
