Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts

  get  "login",  to: "sessions#new",     as: :login
  post "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  get  "signup", to: "users#new",        as: :signup
  post "signup", to: "users#create"

  get "up" => "rails/health#show", as: :rails_health_check
end
