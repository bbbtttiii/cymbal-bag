Rails.application.routes.draw do
  resources :favorites
  resources :cymbals
  resources :users

  # resources :favorites, except: [:show, :index]
  # resources :users
  # resources :cymbals, except: [:create, :edit, :update]

  # resources :users, only: [:show, :index] do
  #   resources :favorites, only: [:show, :index]
  # end

  resources :cymbals do
    resources :favorites
  end

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/session', to: 'session#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  get '/logout', to: 'sessions#destroy', as: 'logout'


  # Routes for Google authentication
  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  post '/auth/google_oauth2/callback', to: 'sessions#google_login'
  get 'auth/failure', to: redirect('/')
end