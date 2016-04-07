class SearchController < ApplicationController

  def index
  	if params[:query].present?
  	  @businesses = Business.search(params[:query], page: params[:page])
  	elsif params[:category].present?
      @businesses = Search.advanced_search(params) 
    else
  		@businesses = Business.all.page params[:page]
  	end
  end

  def autocomplete
    render json: Business.search(params[:query], autocomplete: true, limit: 10).map(&:name)
  end

end
