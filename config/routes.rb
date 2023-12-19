# == Route Map
#

Rails.application.routes.draw do
  root 'posts#index'

  resources :reactions, only: %w[create update destroy]

  resources :posts do
    resources :posts, only: %w[index new create]
    resources :comments, only: %w[create destroy]
  end

  resources :comments do
    resources :comments, only: %w[create destroy]
  end

  devise_scope :user do
    get 'dashboard', to: 'users/registrations#edit'
    get 'remove_avatar', to: 'users/registrations#remove_avatar'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, param: :_username

  namespace :api do
    namespace :v1 do
      resources :users, param: :_username, only: %i[show create]
      resources :posts, only: %i[index show]
    end
  end

  # Custom API endpoints
  post '/sign_up', to: 'api/v1/users/registrations#create'
  post '/login', to: 'api/v1/users/sessions#create'

  # FIX: Later: Test if this catches bad html requests
  get '/*a', to: 'api/v1/bad_requests#not_found'
  post '/*a', to: 'api/v1/bad_requests#not_found'
end
