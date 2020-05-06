Rails.application.routes.draw do
  
  resources :rooms, only: [:show, :index]
  resources :thoughts, only: [:create, :update, :edit, :destroy] do 
    resources :likes, only: [:create, :destroy]
    resource :comments, only: [:show]
  end
  devise_for :users
  resources :users, only: [:show] do
    get 'followings', to: 'users#followings'
    get 'followers', to: 'users#followers'
  end
  resources :followings, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  root 'home#index'
  get 'me', to: 'users#me'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
