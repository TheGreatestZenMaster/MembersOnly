Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index]
  
  root 'posts#index'
  get    '/login',   to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
end
