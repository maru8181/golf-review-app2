Rails.application.routes.draw do
  root 'tops#index'
  resources :tweets
  resources :members, only: [:show]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
end
