class City < ActiveRecord::Base
   belongs_to :country
   has_one 	 :address

   validates :country, presence: true
   validates :name, presence: true
end
