Rails.application.routes.draw do
  resources :portfolios
  # Accept get reuest to get /pages/home. This will route to the home action in pages_controller.rb
   
  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
