Rails.application.routes.draw do

  get 'search/index'

  resources :rating, only: [:index,:create,:update]

  get 'upload_photos/index'

  mount Commontator::Engine => '/commontator'
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  # mount RailsAdmin::Engine => 'admin/suggest_business/:id/edit', :as => :suggest_business 
  
  root 'homepages#index', as: "homepage"
 
  get 'businesses/open'
  get 'search/advanced'
  get 'search/by_product'

  resources :businesses, only: [:index, :show]
  resources :suggest_businesses, only: [:new, :create]
  resources :profiles, only: [:index, :update]
  resources :suggest_edits, only: [:index]
  post "suggest_edits/new" => "suggest_edits#create"
  resources :suggest_photos, only: [:index, :new, :create]

  devise_for :users, controllers: 
  {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    :omniauth_callbacks => "omniauth_callbacks"
  }   
  
   resources :search, only: :index do
    collection do
      get :autocomplete # <= add this line
    end
  end
end
