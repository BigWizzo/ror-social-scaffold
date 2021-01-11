Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :friendships
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  patch 'accept', to: 'friendships#accept'
  delete 'reject', to: 'friendships#reject'
  delete 'unfriend', to: 'friendships#unfriend'
  delete 'cancel', to: 'friendships#cancel'

  get 'friendships/new'
  get 'friendships/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
