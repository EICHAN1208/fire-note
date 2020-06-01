Rails.application.routes.draw do

  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'top#index'
  get '/timeline', to:'articles#timeline'
  get '/favorites', to: 'articles#favorites'

  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resource :stocks, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    member do
      get :follows
      get :followers
      get :stocks
      get :favorites
    end
  end
end
