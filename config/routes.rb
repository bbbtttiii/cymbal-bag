Rails.application.routes.draw do
  resources :bags
  resources :cymbals
  resources :users

  root 'welcome#home'

  get '/signin', to: 'sessions#new', as: 'signin'
  get '/signup', to: 'users#new', as: 'signup'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
