class BusinessAddress < ActiveRecord::Base
	
	belongs_to :business
	belongs_to :address

end
