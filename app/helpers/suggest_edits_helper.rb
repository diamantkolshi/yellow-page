module SuggestEditsHelper

 	def check_suggested
        unless require_params[:business_closed] == "1"
       	   require_params
      	else
      	   require_params[:business_closed]      	 
       	end
	end

	def field_empty
       @update_attribute
    end


  
end
	