class BusinessesController < ApplicationController

  def index 
    if params[:businesses].present? 	
  	   @businesses = Business.where(slug: params[:businesses]).paginate(:page => params[:page], :per_page => 9)
    else
       @businesses = Business.all.paginate(:page => params[:page], :per_page => 9)
    end
  end

  def show 
  	@business = Business.friendly.find(params[:id])
    @business_addresses = Business.find(@business.id).addresses
    @suggest_photos = SuggestPhoto.where(business_id: @business.id, confirm: true)
  	@types = Type.all
  	@products = @business.products.all
  	@business_products = BusinessProduct.all

    @rating = Rating.where(business_id: @business.id).order(created_at: :asc)
  end

  def aggregations
    @businesses = Business.search( where: {
      category_name: params[:name]
      }).results

    if @businesses.empty?
      @businesses = []
    end

    redirect_to action: "index", businesses: @businesses
  end 
end


