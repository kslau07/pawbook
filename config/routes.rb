# == Route Map
#

# root 'posts#index'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[index show create]
    end
  end
  devise_for :users
end
