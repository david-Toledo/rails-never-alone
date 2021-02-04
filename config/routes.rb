Rails.application.routes.draw do


  #Get the login token from Knock
  post 'user_token' => 'user_token#create'

  #User routes
  get '/users/current' => 'users#current'
  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  #User routes
  get '/users/current' => 'users#current'
  resources :users
  resources :responses
  resources :posts

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Get the login token from Knock
  post 'user_token' => 'user_token#create'



end
