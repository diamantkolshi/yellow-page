class BusinessProduct < ActiveRecord::Base
	belongs_to :business
	belongs_to :product

	validates :business, presence: true
	validates :product, presence: true
	validates :price, presence: true	
end
