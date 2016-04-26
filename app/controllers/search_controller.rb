class SearchController < ApplicationController
   
  def index
    if params[:query].present?
      @businesses = Business.search(params[:query], suggest: true, page: params[:page], per_page: 10)
    else
      @businesses = Business.all.page params[:page]
    end
  end

end


