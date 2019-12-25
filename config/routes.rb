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
end

resources :users do
  resources :articles


end
resources :users do
    member do
      get :confirm_email
    end
  end
end
