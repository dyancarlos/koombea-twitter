Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :tweets, only: %i[new create]
  resources :following, only: :index
  resources :followers, only: :index

  post 'follow/:user_id' => 'relationships#create', as: :follow
  get ':user_id' => 'users#show', as: :user
end
