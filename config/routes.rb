Rails.application.routes.draw do
  get 'upload_photos/index'

  devise_for :users

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  
  root 'homepages#index', as: "homepage"
 
  resources :businesses, only: [:index, :show]

end
