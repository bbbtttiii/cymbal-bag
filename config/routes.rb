Rails.application.routes.draw do
  resources :bags
  resources :cymbals
  resources :users

  root 'welcome#home'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
