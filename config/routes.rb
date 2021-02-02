Rails.application.routes.draw do


  get '/posts/search' => 'posts#search'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users
  resources :responses
  resources :posts

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
