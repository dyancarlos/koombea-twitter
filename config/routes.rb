Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :tweets, only: %i[new create]

  post 'follow/:user_id' => 'relationships#create', as: :follow
  get ':user_id' => 'users#show', as: :user
  get ':user_id/followers' => 'followers#index', as: :followers
  get ':user_id/following' => 'following#index', as: :following
end
