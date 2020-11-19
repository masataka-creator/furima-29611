Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
 devise_for :users
 root "items#index"
 resources :users, only: [:edit, :update]
 resources :items, only: [:new, :create, :edit, :update]
 resources :articles
end
