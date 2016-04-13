Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :clients
  resources :bands
  resources :musicians
  resources :events

  get 'define-user-type' => 'pages#define_user_type'

  root 'events#index'
end
