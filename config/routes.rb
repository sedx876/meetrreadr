Rails.application.routes.draw do
  root 'static#welcome'
  
  resources :books do
    resources :comments
  end
 resources :tags 
 resources :users
 resources :static
 #resources :user_sessions, only: [ :new, :create, :destroy ]

#  get '/login', to: 'user_sessions#new'
#  post '/login', to: 'user_sessions#create'
#  delete '/logout', to: 'user_sessions#destroy'

get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  get '/logout', to: 'user_sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


# get 'login'  => 'user_sessions#new', :as => "login"
# post 'login' => 'user_sessions#create'
# #post 'login' => 'user_sessions#create'
# #match 'login' => 'user_sessions#create', :as => :login, :via => :post
# get 'logout' => 'user_sessions#destroy', :as => "logout"
# get 'signup', to: 'users#new'
# post 'signup' => 'users#create'
get 'welcome' => 'static#welcome', :as => "welcome"
get '/users_books', to: 'books#users_books'
end
