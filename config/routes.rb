Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'friends_list', to: 'users#friends_list'
  get 'search_stock', to: 'stocks#search'
end