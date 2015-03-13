Rails.application.routes.draw do
  root to: 'users#new'
  resources :users
  resources :trips

  resources :ski_locations

  # get '/login' => 'users#new'
  post '/login' => :login, controller: :users
  delete '/login' => :logout, controller: :users


  get "*path", to: redirect('/')
end
