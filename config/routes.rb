Rails.application.routes.draw do

  get 'search/index'

  resources :rating, only: [:index,:create,:update]
  get 'rating/create_rate', as: :businesses_create_rate

  get 'upload_photos/index'

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  # mount RailsAdmin::Engine => 'admin/suggest_business/:id/edit', :as => :suggest_business 
  
  root 'homepages#index', as: "homepage"
 
  get 'businesses/open'
  get 'search/advanced'
  get 'search/by_product'
  get 'search/filter'
  get 'businesses/aggregations'

  resources :businesses, only: [:index, :show]
  resources :comments, only: [:create]

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

 #api
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
      resources :businesses, only: [:index, :show]
      resources :comments, only: [:create]
      resources :homepages, only: [:index]
      resources :profiles, only: [:index]
      resources :rating, only: [:create, :update]
      get "search/filter" => "search#filter"
      resources :search, only: [:index]
      resources :suggest_businesses, only: [:create]
      # resources :sessions, only: [:create, :destroy] 

      devise_scope :user do
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
    end
  end
end
