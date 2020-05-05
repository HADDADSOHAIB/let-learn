Rails.application.routes.draw do
  
  resources :thoughts, only: [:create, :update, :edit, :destroy] do 
    resources :likes, only: [:create, :destroy]
    resource :comments, only: [:show]
  end
  devise_for :users
  resources :users, only: [:show]
  get 'me', to: 'users#me'
  post 'follow', to: 'followings#follow', as: :follow
  post 'unfollow', to: 'followings#unfollow', as: :unfollow
  get 'followings', to: 'users#followings', as: :followings
  get 'followers', to: 'users#followers', as: :followers
  root 'home#index'
  resources :comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
