Rails.application.routes.draw do
  post "login", to: "users#login"
  get "get_available_dates", to: "available_slots#get_available_dates"
  get "get_recurring_hours", to: "recurring_hours#get_recurring_hours"
  post "post_recurring_hours", to: "recurring_hours#post_recurring_hours"

  # resources :bookings
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
