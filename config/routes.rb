Rails.application.routes.draw do
  resources :bags
  resources :users
  resources :cymbals

   #users/:id/bags/:bag_id
  resources :users, only: [:show] do
    resources :bags, only: [:show, :index]
  end

#need nested show/index

  resources :bags do
    resources :cymbals
  end

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/session', to: 'session#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/cymbals/new', to: 'cymbals#new'
  post '/cymbals/new', to: 'cymbals#create'

  get '/bags/:id', to: 'bags#show'
  post '/bags/new', to: 'bags#create'

  # Routes for Google authentication
  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  post '/auth/google_oauth2/callback', to: 'sessions#google_login'
  get 'auth/failure', to: redirect('/')
end