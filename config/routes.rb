Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'
   get "log_out" => "sessions#destroy", :as => "log_out"
   get "log_in" => "sessions#new", :as => "log_in"
   get "sign_up" => "users#new", :as => "sign_up"
  
   root :to => "sessions#new"
 
   resources :users
   resources :sessions

   get '/auth/failure', to: 'sessions#failure'
   get 'twitter/new'
   get '/profile', to: 'sessions#show', as: 'show'
   get '/auth/twitter/callback', to: 'sessions#twitterlogin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
