class CommentsController < ApplicationController
  def create
	  @business = Business.find(params[:business_id])
	  @comment = @business.comments.build(content: params[:content], user_id: current_user.id)
	  @comment.save
    respond_to do |format|
        format.html { redirect_to @business }
        format.js 
    end
  end


end
