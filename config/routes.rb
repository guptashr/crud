Rails.application.routes.draw do
  resources :users
  root 'main#index'
  get 'about', to: 'main#about'
  resources :articles
end
