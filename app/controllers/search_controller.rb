class SearchController < ApplicationController
  def index
  	if params[:query].present?
  	  @businesses = Business.search(params[:query], page: params[:page])
  	else
  		@businesses = Business.all.page params[:page]
  	end
  end

  def autocomplete
    render json: Business.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end
end
