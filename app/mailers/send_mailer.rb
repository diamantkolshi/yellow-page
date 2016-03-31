class SendMailer < ActionMailer::Base

  def business_suggest(business_params)
    @new_business = business_params

    mail to: "mozaix.rails@gmail.com", subject: "Suggest Business"
  end	

  def suggest_and_edit(attribute_edited, business_attr,	user)
  	@update_attribute = attribute_edited
  	@business_attribute = business_attr
  	@user = user
      
  	mail to: "mozaix.rails@gmail.com", subject: "Suggest end edit"
  end
end
