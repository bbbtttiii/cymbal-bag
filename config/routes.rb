Rails.application.routes.draw do
  resources :bags

  resources :cymbals

  resources :users, only: [:new, :create, :show] do
    resources :bags, only: [:index, :show]
  end

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/session', to: 'session#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/facebook/callback' => 'sessions#create_with_fb'

end