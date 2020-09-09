Rails.application.routes.draw do
  devise_for :users
  get 'page/home'
  root to: 'page#home'
  delete 'follows/:user_id' => 'follows#destroy'
  resources :users, only: [:show, :edit, :update] do resources :posts
  resources :followers, only: :index
  resources :following, only: :index
  end
  resources :follows, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
