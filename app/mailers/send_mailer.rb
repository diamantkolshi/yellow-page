class SendMailer < ActionMailer::Base

  def business_suggest(business_params)
    @new_business = business_params

    mail to: "mozaix.rails@gmail.com", subject: "Suggest Business"
  end
end
