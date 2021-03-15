Rails.application.routes.draw do
  resources :users
  resources :messages
  resources :topics
  root 'messages#index'
  get '/signup', to: 'users#new'
  
end
