Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  get 'articles/show'
  get 'articles/edit'
  devise_for :users
  root 'top#index'


  resources :articles do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :stocks, only: [:index, :create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end
