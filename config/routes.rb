Rails.application.routes.draw do
  root 'messages#index'
  get '/signup', to: 'users#new'
  resources :users
end
