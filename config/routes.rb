Rails.application.routes.draw do
  root "posts#index"
  resources :posts

  get  "login",  to: "sessions#new",     as: :login
  post "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  get  "signup",   to: "users#new",        as: :signup
  post "signup",   to: "users#create"

  get   "settings", to: "users#edit",     as: :settings
  patch "settings", to: "users#update"

  get "up" => "rails/health#show", as: :rails_health_check
end
