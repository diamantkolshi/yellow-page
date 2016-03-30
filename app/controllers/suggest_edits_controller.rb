class SuggestEditsController < ApplicationController
	include SuggestEditsHelper
	before_action :authenticate_user!
    before_action :business_id_exist?, only: "index"

	def index
        @business_suggest_edit = Business.find(params[:id])
	   	@edit = SuggestEdit.new 
	end
    
    def create    
        @update_attribute = check_suggested 
        field_empty          
    end 	    
   

    private

	def require_params
	    params.require(:suggest_edit).permit(:business_closed, :name, :city, :address, :established, :zip_code, :business_tel, :fax_number, :opening_hours, :website, :facebook, :instagram, :google)
	end
    

    def business_id_exist?
	   	unless params[:id]
	   	   redirect_to root_path
	   	end
	end
  
end
