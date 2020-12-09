Rails.application.routes.draw do
 devise_for :users
 root 'items#index'
 resources :users, only: [:edit, :update]
 resources :items do
   resources :orders, only: [:index, :create, :edit, :new]
 end
end
