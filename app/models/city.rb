class City < ActiveRecord::Base
   belongs_to :country
   has_many   :business_cities 
   has_many   :businesses, through: :business_cities
end
