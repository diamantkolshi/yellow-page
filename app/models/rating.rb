class Rating < ActiveRecord::Base
   
 def self.user_rate(business, user)
   self.where(business_id: business, user_id: user).exists? ? true : false
 end

end
