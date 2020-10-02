Rails.application.routes.draw do
  resources :workouts
  resources :users
  resources :clients

   #users/:id/workouts/:workout_id
  resources :users, only: [:show] do
    resources :workouts, only: [:show, :index]
  end

#need nested show/index

  resources :workouts do
    resources :clients
  end

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/session', to: 'session#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/clients/new', to: 'clients#new'
  post '/clients/new', to: 'clients#create'

  get '/workouts/:id', to: 'workouts#show'
  post '/workouts/new', to: 'workouts#create'

  # Routes for Google authentication
  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  post '/auth/google_oauth2/callback', to: 'sessions#google_login'
  get 'auth/failure', to: redirect('/')
end