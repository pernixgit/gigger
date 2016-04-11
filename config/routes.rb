Rails.application.routes.draw do
  devise_for :users, controller: { registrations: "users/registrations" }
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :clients
  resources :bands
  resources :musicians
  resources :events

  get 'user_root' => 'pages#define_user_type'

  root 'events#index'
end
