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
    # @business_rate = Rate.where(rateable_id: @business.id)
    @status = business_status(@business)
    @rating = Rating.where(business_id: params[:id]).order(created_at: :desc)
    @average = business_rate(@rating)
  end

  def business_status(business)
    work_per_day = business.working_days
    work_per_day.each do |work|
      if work.day.name == Time.now.strftime("%A")
        return status_business(work)
      end
    end
    []
  end

  def status_business(work)
    (work.open.strftime("%H:%M")..work.close.strftime("%H:%M")).include?(Time.now.strftime("%H:%M"))
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


