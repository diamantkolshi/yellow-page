class City < ActiveRecord::Base
   belongs_to :country
   has_many   :business_cities 
   has_many   :businesses, through: :business_cities

   validates :country, presence: true
   validates :name, presence: true
end
