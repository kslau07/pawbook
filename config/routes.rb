# == Route Map
#

Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: %w[index new create]
  resources :users, param: :_username
  get 'dashboard', to: 'users/dashboards#show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # TODO: Delete me, delete controller action, and delete view
  # For testing purposes
  get '/posts/test', to: 'posts#test'

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
