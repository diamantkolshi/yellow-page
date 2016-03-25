Rails.application.routes.draw do
  get 'upload_photos/index'

  # devise_for :users

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  
  root 'homepages#index', as: "homepage"
 
  resources :businesses, only: [:index, :show]
  resources :suggest_businesses, only: [:new, :create]

  devise_for :users, controllers: 
  {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }   


end
