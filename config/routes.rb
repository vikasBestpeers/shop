Rails.application.routes.draw do
  devise_for :users
  root to: "homepage#index"
  # post "seller/create", to: "seller#create"
  resources :seller
  resources :customer
  resources :cart
  resources :order

  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :seller do
      resources :sessions
    end
  end
end
  # resources :product
  # get "/customer", to: "customer#index"
  # get "home", to: "homepage#homepage"

end
