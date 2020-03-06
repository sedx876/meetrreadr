Rails.application.routes.draw do
  root 'static#welcome'
  
  resources :books do
    resources :comments
  end
 resources :tags 
 resources :users
 resources :static
 resources :user_sessions, only: [ :new, :create, :destroy ]

get 'login'  => 'user_sessions#new', :as => "login"
post 'login' => 'user_sessions#create'
get 'logout' => 'user_sessions#destroy', :as => "logout"
get 'signup', to: 'users#new'
post 'signup' => 'users#create'
get 'welcome' => 'static#welcome', :as => "welcome"
end
