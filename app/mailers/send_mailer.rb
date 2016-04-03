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

  def suggest_photo(suggest, user)
    @suggest_attr = suggest
    @user = user

    attachments.inline[@suggest_attr.source.to_s.split("o/").last] = File.read(@suggest_attr.source.file.file)
    mail to: "mozaix.rails@gmail.com", subject: "suggest a photo"
  end
end
