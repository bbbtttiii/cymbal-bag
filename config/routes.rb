Rails.application.routes.draw do
  resources :bags
  resources :users
  resources :cymbals

  resources :users, only: [:show] do
    resources :bags, only: [:show, :index]
  end

  resources :bags do
    resources :cymbals, only: [:new, :create, :edit, :update]
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