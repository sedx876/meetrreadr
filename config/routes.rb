Rails.application.routes.draw do
  root 'static#welcome'
  
  resources :books do
    resources :comments
  end

 resources :tags 
 resources :users
 resources :static
 
get '/login', to: 'user_sessions#new'
post '/login', to: 'user_sessions#create'
get '/logout', to: 'user_sessions#destroy'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'

get 'welcome' => 'static#welcome', :as => "welcome"
get '/users_books' => 'books#users_books', :as => "users_books"
end
