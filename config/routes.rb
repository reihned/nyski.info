Rails.application.routes.draw do
  root to: 'welcome#index' # 'users#new'
  resources :users, only: [:new, :create, :show, :delete, :edit]
  resources :trips
  resources :invitations

  resources :ski_locations

  # get '/login' => 'users#new'
  post '/login' => :login, controller: :users
  delete '/login' => :logout, controller: :users

  resources :search, only: [:new, :create, :show]

  resources :welcome, only: [:index]

  get "*path", to: redirect('/')
end
