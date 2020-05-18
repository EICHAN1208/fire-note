Rails.application.routes.draw do

  # get 'stocks/create'
  # get 'stocks/destroy'
  # get 'relationships/create'
  # get 'relationships/destroy'
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'top#index'
  get '/timeline', to:'articles#timeline'


  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resource :stocks, only: [:index, :create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end
