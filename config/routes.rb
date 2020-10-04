Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show], :constraints => { :id => /[0-9|]+/ }
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'friends_list', to: 'users#friends_list'
  get 'search_friend', to: 'users#search'
  get 'search_stock', to: 'stocks#search'
end