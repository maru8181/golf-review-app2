Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users
  resources :tweets
  resources :members, only: [:show]
end
