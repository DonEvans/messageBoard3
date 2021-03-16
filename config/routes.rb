Rails.application.routes.draw do
  
  root 'messages#index'
  
  get '/signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  #get 'topics/new'
  #get 'topics/create'
  #get 'topics/show'
  #get 'topics/index'

  resources :users
  resources :messages
  resources :topics
  
end
