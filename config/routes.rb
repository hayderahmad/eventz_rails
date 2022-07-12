Rails.application.routes.draw do
  resources :categories
  root "events#index"
  get "signup", to: "users#new"
  get "/events/filter/:filtered", to: "events#index", as: :filtered_events
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :events do
    resources :registrations
    resources :likes
  end
end
