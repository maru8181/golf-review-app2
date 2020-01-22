Rails.application.routes.draw do
  root 'tops#index'

  resources :tweets do
    get 'follow_tweet', on: :collection
  end

  resources :members, only: [:show] do
    get :following, :followers, on: :member
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :relationships, only: %i[create destroy]
end
