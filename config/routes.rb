Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :tweets, only: %i[new create]
  resources :following, only: :index
end
