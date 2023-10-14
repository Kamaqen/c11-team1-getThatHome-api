Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  #Properties
  resources :properties

  #Sessions
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # Users
  resources :users, only: :create
  get "/profile", to: "users#show"
  patch "/profile", to: "users#update"

  #User-Properties
  resources :user_properties do
    get "/saved", on: :collection, action: :saved
    get "/contacted", on: :collection, action: :contacted
  end
end
