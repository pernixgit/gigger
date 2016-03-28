Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users
  
  resources :clients
  resources :bands
  resources :musicians
end
