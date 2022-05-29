Rails.application.routes.draw do
  resources :portfolios
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'pages/contact'

  resources :blogs

  root to: 'pages#home'
end
