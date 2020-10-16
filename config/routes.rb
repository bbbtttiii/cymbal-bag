Rails.application.routes.draw do
  resources :favorites, except: [:index, :show]
  resources :users, except: [:destroy, :update, :edit]

  resources :cymbals do
    resources :favorites, except: [:index, :show, :destroy]
  end

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/session', to: 'session#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/rides', to: 'cymbals#rides'

  # Routes for Google authentication
  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  post '/auth/google_oauth2/callback', to: 'sessions#google_login'
  get 'auth/failure', to: redirect('/')
end