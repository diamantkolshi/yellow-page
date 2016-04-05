class BusinessesController < ApplicationController


  def index  	
  	@businesses = Business.all.paginate(:page => params[:page], :per_page => 4)
  end

  def show 
  	@business = Business.find(params[:id])
    @suggest_photos = SuggestPhoto.where(business_id: params[:id], confirm: true)
  	commontator_thread_show(@business)
  	@types = Type.all
  	@products = @business.products.all
  	@business_products = BusinessProduct.all
    @business_rate = Rate.where(rateable_id: @business.id)
  end
  
end


