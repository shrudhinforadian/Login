Rails.application.routes.draw do
  get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 get '/logout' => 'sessions#destroy'

 get '/signup' => 'users#new'
 post '/users' => 'users#create'
  root :to => "users#new"
  resources :users
  resources :sessions
  resources :welcome
  resources :articles
  resources :articles do
  resources :comments

resources :users do
  resources :articles
end
end
end
