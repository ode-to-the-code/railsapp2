Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources: welcome

  resources :posts
  resources :comments
  resources :users

  root "welcome#welcome"

  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"

  get '/signup' => 'users#new'
  get '/signout' => "sessions#destroy"

  


end
