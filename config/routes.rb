Rails.application.routes.draw do
  devise_for :users
  root to: "homepage#index"
  # post "seller/create", to: "seller#create"
  resources :seller
  resources :customer
  resources :cart
  resources :order
  # resources :product
  # get "/customer", to: "customer#index"
  # get "home", to: "homepage#homepage"

end
