Rails.application.routes.draw do
  resources :reviews
  resources :users
  resources :drums

   #users/:id/reviews/:review_id
  resources :users, only: [:show] do
    resources :reviews, only: [:show, :index]
  end

#need nested show/index

  resources :reviews do
    resources :drums
  end

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/session', to: 'session#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/drums/new', to: 'drums#new'
  post '/drums/new', to: 'drums#create'

  get '/reviews/:id', to: 'reviews#show'
  post '/reviews/new', to: 'reviews#create'

  # Routes for Google authentication
  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  post '/auth/google_oauth2/callback', to: 'sessions#google_login'
  get 'auth/failure', to: redirect('/')
end