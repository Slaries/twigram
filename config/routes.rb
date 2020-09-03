Rails.application.routes.draw do
  devise_for :users
  get 'page/home'
  root to: 'page#home'
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
