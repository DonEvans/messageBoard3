Rails.application.routes.draw do
  get 'topics/new'
  get 'topics/create'
  get 'topics/show'
  get 'topics/index'
  resources :users
  resources :messages
  resources :topics
  root 'messages#index'
  get '/signup', to: 'users#new'
  
end
