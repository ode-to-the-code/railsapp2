Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources: welcome
  get '/users/created_today' => "users#created_today"

  resources :posts do
    resources :comments
  end

  resources :users do
    resources :posts
  end

  resources :comments


  root "welcome#welcome"

  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"

  get '/signup' => 'users#new'
  get '/signout' => "sessions#destroy"

  # get '/auth/facebook/callback' => "sessions#create"
  get '/auth/facebook/callback' => "sessions#create"

  get '/auth/google_oauth2/callback' => "sessions#omniauth"


end
