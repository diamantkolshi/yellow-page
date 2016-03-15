Rails.application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  
  get 'businesses/index'
  root 'homepages#index', as: "homepage"

end
