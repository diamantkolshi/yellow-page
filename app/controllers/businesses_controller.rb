class BusinessesController < ApplicationController


  def index  	
  	@businesses = Business.all.paginate(:page => params[:page], :per_page => 2)
  end

  def show 
  	@business = Business.find(params[:id])
  	commontator_thread_show(@business)
  	@types = Type.all
  	@products = @business.products.all
  	@business_products = BusinessProduct.all
    @business_rate = Rate.where(rateable_id: @business.id)
  end
  
end


