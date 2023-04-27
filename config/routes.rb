Rails.application.routes.draw do
  resources :users
  root 'main#index'
  get 'about', to: 'main#about'
  resources :articles

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]  
end
