class BusinessesController < ApplicationController

  def index  	
  	@businesses = Business.all.paginate(:page => params[:page], :per_page => 9)
  end

  def show 
  	@business = Business.friendly.find(params[:id])
    @business_addresses = Business.find(@business.id).addresses
    @suggest_photos = SuggestPhoto.where(business_id: params[:id], confirm: true)
  	commontator_thread_show(@business)
  	@types = Type.all
  	@products = @business.products.all
  	@business_products = BusinessProduct.all
    
    # @business_rate = Rate.where(rateable_id: @business.id)
    @rating = Rating.where(business_id: Business.find_by(slug: params[:id]).id).order(created_at: :asc)

    @average = business_rate(@rating)
  end

  def open
    @open = Business.all
  end

  def business_rate(rateable)
    if rateable != []
     adv_score = 0
     rateable.each do |r|
       adv_score += r.score
     end
     adv_score / rateable.count
    else
      0
    end
  end
end


