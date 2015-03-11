Rails.application.routes.draw do
  root to: 'users#new'
  resources :users

  resources :ski_locations

  post '/login' => :login, controller: :users
  delete '/login' => :logout, controller: :users
end
