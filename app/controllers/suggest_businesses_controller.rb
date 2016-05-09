class SuggestBusinessesController < ApplicationController


	  def new
      	@suggest_business = SuggestBusiness.new
    end 

    def create
      @suggest_business = SuggestBusiness.new(require_params)
  
    	if @suggest_business.save
        SendMailer.business_suggest(require_params).deliver_now
        redirect_to homepage_path
      else
        render "new"
      end
    end

	def require_params
	    params.require(:suggest_business).permit(:name, :email, :tel, :message)
	end
  
end
