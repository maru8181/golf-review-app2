Rails.application.routes.draw do
  root 'tops#index'
  resources :tweets
  resources :members, only: [:show] do
    get :following, :followers, on: :member
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  # resources :users do
  #   member do
  #     get :following, :followers
  #   end
  # end
  resources :relationships, only: %i[create destroy]
end
