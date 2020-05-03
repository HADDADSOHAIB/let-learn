Rails.application.routes.draw do
  
  resources :thoughts, only: [:create, :update, :destroy]
  devise_for :users
  resources :users, only: [:show]
  get 'me', to: 'users#me'
  post 'followings', to: 'followings#follow', as: :follow
  post 'unfollowings', to: 'followings#unfollow', as: :unfollow
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
