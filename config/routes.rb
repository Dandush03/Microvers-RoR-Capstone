Rails.application.routes.draw do
  root to: 'cultures#index'
  resources :cultures, only: [:show, :create, :destroy] 
  resources :followings, only: [:create, :destroy] 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
