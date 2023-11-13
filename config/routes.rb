# == Route Map
#

# root 'posts#index'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Custom API endpoints
  post '/sign_up', to: 'api/v1/users/registrations#create'
  post '/login', to: 'api/v1/users/sessions#create'

  namespace :api do
    namespace :v1 do
      # resources :users, only: %i[create]
      resources :posts, only: %i[index show create]
    end
  end
end
