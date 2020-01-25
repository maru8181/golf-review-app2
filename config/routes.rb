Rails.application.routes.draw do
  root 'tops#index'
  
  resources :tops, only: %i[index] do
    get :not_login, on: :collection
  end

  resources :tweets do
    get :follow_tweet, on: :collection
    resources :likes, only: %i[create destroy]
  end

  resources :members, only: %i[show index destroy] do
    get :following, :followers, on: :member
  end

  resources :golves, only: %i[index show] do
    get :rank, on: :collection
  end

  resources :relationships, only: %i[create destroy]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to:'users/sessions#new_guest'
  end

end
