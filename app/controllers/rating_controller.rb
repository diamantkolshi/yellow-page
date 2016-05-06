class RatingController < ApplicationController

  def index
  end

  def create_rate 
    rate = nil
    Rating.where(business_id: params[:business]).each do |rating|
      if rating.user_id == current_user.id
        rate = rating
        rating.score = params[:rating]
        rating.save
        break 
      end
    end
     Rating.create(user_id: current_user.id, business_id: params[:business], score: params[:rating]) unless rate
     business_id = params[:business]
     Rating.added_average business_id
     @ratings = Rating.where(business_id: params[:business])
     respond_to do |format|
      format.js 
     end
  end

	def create
		 @rating = Rating.new(user_id: current_user.id, business_id: params[:business_id], score: params[:score])
  	 if @rating.save
  	 	  Rating.added_average(params[:business_id])
 	 	    flash[:success] = "Thank you for rating"
  	 end
	end
	
	def update
    @rating_update = Rating.find(params[:id])
    if @rating_update.update_attributes(score: params[:score])
     	Rating.added_average(params[:business_id])
 	    flash[:success] = "Change your rate successfully"
    end
	end

end
