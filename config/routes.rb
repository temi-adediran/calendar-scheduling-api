Rails.application.routes.draw do
  post "login", to: "users#login"

  get "get_recurring_hours", to: "recurring_hours#get_recurring_hours"
  post "post_recurring_hours", to: "recurring_hours#post_recurring_hours"

  get "get_available_dates", to: "available_dates#get_available_dates"
  post "post_available_dates", to: "available_dates#post_available_dates"
  delete "delete_available_date", to: "available_dates#delete_available_date"

  get "available_slots_by_month", to: "coach#available_slots_by_month"

  post "book_session", to: "bookings#book_session"
  get "upcoming_session", to: "bookings#upcoming_session"
  get "past_session", to: "bookings#past_session"
  post "post_rating", to: "bookings#post_rating"

  # resources :bookings
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
