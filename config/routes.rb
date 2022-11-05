Rails.application.routes.draw do
  resources :user_profiles
  resources :users
  resources :orders
  resources :use_profiles
  resources :deliveries
  resources :receipts
  resources :services
  # resources :admin
  get "/me", to: "users#show"

  devise_for :admins, path: 'admin', path_names:{
    sign_in: 'login',
    sign_out: 'signout',
    registration: 'signup'
  },
  controllers:{
    sessions: 'admin/sessions',
    password: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :users, path: 'users', path_names:{
    sign_in: 'login',
    sign_out: 'signout',
    registration: 'signup'
  },

  controllers:{
    sessions: 'users/devise/sessions',
    password: 'users/devise/passwords',
    registrations: 'users/devise/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
