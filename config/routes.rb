Rails.application.routes.draw do
  resources :interestedevents, only: [ :index ]
  root "posts#index"
  resources :posts do
    # interested button for posts
    resources :interestedevents, only: [ :index, :create, :destroy ]
  end

  get  "login",  to: "sessions#new",     as: :login
  post "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  get  "signup",   to: "users#new",        as: :signup
  post "signup",   to: "users#create"

  get   "settings", to: "users#edit",     as: :settings
  patch "settings", to: "users#update"

  get "up" => "rails/health#show", as: :rails_health_check
end
