Rails.application.routes.draw do
  devise_for :users
  root"students#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :students

  # Defines the root path route ("/")
  # root "posts#index"
end
