class RatingController < ApplicationController

  def index
  	 @rating = Rating.new(user_id: current_user.id, business_id: params[:business_id], score: params[:score])
  	 if @rating.save
 	 	    flash[:success] = "Thank you for rating"
  	 end
	end
	
end
