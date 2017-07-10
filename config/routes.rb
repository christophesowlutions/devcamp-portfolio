Rails.application.routes.draw do
  # This created all kinds of routes for registration, log in, log out, etc.
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'log_out', sign_up: 'register' }
  # The above changes the following path names to the respective ones (sign_in to login ,etc.) 
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  
  get 'portfolios/:id', to: 'portfolios#show', as: 'portfolio_show' # Get the route with /:id and map it to the #show action as portoflio_show
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
