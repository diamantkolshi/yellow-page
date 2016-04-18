RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  
  config.excluded_models = [ BusinessCategory, BusinessCity ,Commontator::Thread, Commontator::Comment, Commontator::Subscription, Search ]


  config.model 'Business' do
    exclude_fields :business_categories
    exclude_fields :business_cities
    exclude_fields :phones
    exclude_fields :videos  
    exclude_fields :photos
    exclude_fields :working_days
    exclude_fields :aka
    exclude_fields :zip_code
    exclude_fields :established
    exclude_fields :payment_mathod
    exclude_fields :business_products 
    exclude_fields :threads  
    exclude_fields :raters_without_dimension
    exclude_fields :rate_raters 
  end

  config.model 'Day' do 
    exclude_fields :working_days  
  end

  config.model 'Product' do 
    exclude_fields :business_products  
    exclude_fields :businesses  
  end
  
  config.model 'Phone' do 
  end
  

  # == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
