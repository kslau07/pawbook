# == Route Map
#

Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Custom API endpoints
  post '/sign_up', to: 'api/v1/users/registrations#create'
  post '/login', to: 'api/v1/users/sessions#create'

  resources :users, param: :_username

  namespace :api do
    namespace :v1 do
      resources :users, param: :_username, only: %i[show create]
      resources :posts, only: %i[index show]
    end
  end

  # FIX: Later: Test if this catches bad html requests
  get '/*a', to: 'api/v1/bad_requests#not_found'
  post '/*a', to: 'api/v1/bad_requests#not_found'
end
