Rails.application.routes.draw do
  devise_for :users

  # mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  
  root 'homepages#index', as: "homepage"
 
  get 'businesses' => "businesses#index"
  get 'businesses/:id' => "businesses#show"

end
