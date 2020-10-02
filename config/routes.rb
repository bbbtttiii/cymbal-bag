Rails.application.routes.draw do
  resources :favorites, except: [:show, :index]
  resources :users, except: [:show, :index]
  resources :cymbals, except: [:new, :create, :edit, :update]

  resources :users, only: [:show, :index] do
    resources :favorites, only: [:show, :index]
  end

  resources :favorites do
    resources :cymbals, only: [:new, :create, :edit, :update]
  end

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/session', to: 'session#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # get '/cymbals/new', to: 'cymbals#new'
  # post '/cymbals/new', to: 'cymbals#create'
  # get '/favorites/:id', to: 'favorites#show'
  # post '/favorites/new', to: 'favorites#create'

  get '/users/:id/favorites/:id', to: 'favorites#show'

  # Routes for Google authentication
  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  post '/auth/google_oauth2/callback', to: 'sessions#google_login'
  get 'auth/failure', to: redirect('/')
end