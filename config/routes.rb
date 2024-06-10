Rails.application.routes.draw do
  # Devise routes
  devise_for :devise_users, controllers: {
    sessions: 'devise_user/sessions',
    registrations: 'devise_user/registrations'
  }

  # Static pages
  root 'static_pages#home'

  # Animal routes
  resources :animals

  # Dashboard
  get '/dashboard', to: 'dashboard#index'

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end