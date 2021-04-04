Rails.application.routes.draw do
  devise_for :users

  get 'sessions/new'

  root 'static_pages#home'
  get  'static_pages/home'
  get  '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  
  resources :users
  resources :microposts, only: [:create, :destroy]
  
end
