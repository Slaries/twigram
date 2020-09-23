Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'page/home'
  root to: 'page#home'

  resources :users, only: [:show, :edit, :update] do resources :posts
  resources :followers, only: :index
  resources :following, only: :index
  end
  resources :posts do
    resources :likes
  end
  resources :likes, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  resources :feed_posts, only: :index
  resources :comments, only: [:create]
  resources :authentications, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
