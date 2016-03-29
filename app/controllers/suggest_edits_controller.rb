class SuggestEditsController < ApplicationController
	before_action :authenticate_user!
    before_action :business_id_exist?

	def index
        @business_suggest = Business.find(params[:id])
	   	@edit = SuggestEdit.new 
	end

	def edit
		redirect_to "index"
	end

	def business_id_exist?
	   	unless params[:id]
	   		redirect_to root_path
	   	end
	end

end
