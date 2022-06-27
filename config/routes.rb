Rails.application.routes.draw do
  root "events#index"
  get "signup", to: "users#new"
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :events do
    resources :registrations
  end
end
