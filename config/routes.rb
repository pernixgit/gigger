Rails.application.routes.draw do
  devise_for :users
  devise_for :musicians
  devise_for :bands
  devise_for :clients
  devise_for :admin_users

  resources :clients
  resources :bands
  resources :musicians
  resources :events

  root 'events#index'
end
