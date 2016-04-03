class SuggestPhotosController < ApplicationController
	def index
  end

  def new
  	@photo_suggest = SuggestPhoto.new
  end
  
  def create
  	@suggest_photo = SuggestPhoto.new(suggest_photo_params.merge!(user_id: current_user.id, business_id: params[:id]))
  	if @suggest_photo.save
      SendMailer.suggest_photo(@suggest_photo, current_user).deliver_now
      flash[:success] = "Thank you for your contribution! Our moderators are currently reviewing your suggestions. Your requested changes should be live shortly."
    	redirect_to business_path(params[:id])
    else
      render "new"
    end  	
  end

  private   

  def suggest_photo_params
  	params.require(:suggest_photo).permit(:source)
  end
end
