Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :trips, only: [:new, :edit, :create, :update, :show, :index, :destroy]
  resources :destinations, only: [:show, :index]
  resources :attractions, only: [:index, :show]
  resources :reviews, only: [:new, :edit, :create, :update, :show, :index, :destroy]


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#destroy'
  get 'authorized', to: 'sessions#page_requires_login'

end
