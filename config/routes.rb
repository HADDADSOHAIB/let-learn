Rails.application.routes.draw do
  
  resources :thoughts, only: [:create, :update, :destroy]
  devise_for :users
  resources :users, only: [:show]
  get 'me', to: 'users#me'
  post 'follow', to: 'followings#follow', as: :follow
  post 'unfollow', to: 'followings#unfollow', as: :unfollow
  get 'followings', to: 'users#followings', as: :followings
  get 'followers', to: 'users#followers', as: :followers
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
