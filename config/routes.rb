Rails.application.routes.draw do
  
  resources :properties, only: [:index, :show, :create, :update, :destroy]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/properties' => 'properties#index'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Users
  resources :users, only: :create
  get "/profile", to: "users#show"
  patch "/profile", to: "users#update"

  # Route for image uploads
  post '/upload_image' => 'images#upload'
end
