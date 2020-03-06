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
get 'logout' => 'user_sessions#destroy', :as => "logout"
get 'signup' => 'users#new', :as => "signup"
get 'welcome' => 'static#welcome', :as => "welcome"
end
