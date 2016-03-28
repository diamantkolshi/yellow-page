Rails.application.routes.draw do

  get 'upload_photos/index'

  mount Commontator::Engine => '/commontator'

  # devise_for :users

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  mount RailsAdmin::Engine => 'admin/suggest_business/:id/edit', :as => :suggest_business 
  
  root 'homepages#index', as: "homepage"
 
  resources :businesses, only: [:index, :show]
  resources :suggest_businesses, only: [:new, :create]
  resources :profiles, only: [:index, :update]

  devise_for :users, controllers: 
  {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }   
 
end
