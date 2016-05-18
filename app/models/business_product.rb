class BusinessProduct < ActiveRecord::Base
	belongs_to :business
	belongs_to :product

	validates :business, presence: true
	validates :product, presence: true
	validates :price, presence: true	

	  after_commit :reindex_business


  def reindex_business
    Business.reindex
  end
end
