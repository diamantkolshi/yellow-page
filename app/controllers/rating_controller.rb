class RatingController < ApplicationController

  def index
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
