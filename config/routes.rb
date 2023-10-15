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
  get "/profile/:id", to: "users#show"
  patch "/profile/:id", to: "users#update"

  #User-Properties
  resources :user_properties do
    get "/saved", on: :collection, action: :index_saved
    get "/contacted", on: :collection, action: :index_contacted
    post "/create_saved", on: :collection, action: :create_saved
    post "/create_contacted", on: :collection, action: :create_contacted
    patch "/update_saved", on: :member, action: :update_saved
    patch "/update_contacted", on: :member, action: :update_contacted
  end
  
end
