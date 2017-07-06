Rails.application.routes.draw do
  devise_for :users # This created all kinds of routes for registration, log in, log out, etc.
  resources :portfolios
  #, except: [:show] # Bring all of the resource routes except show, so I cna create my own show action
  #get 'portfolios/:id', to: 'portfolios#show', as: 'portfolio_show' # because otherwise it would still submit it as portfolios
  # Accept get reuest to get /pages/home. This will route to the home action in pages_controller.rb

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  get 'pages/hello'


  resources :blogs do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home' # Setting the homepage as pages/home5
end
