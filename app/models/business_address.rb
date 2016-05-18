class BusinessAddress < ActiveRecord::Base
	
	belongs_to :business
	belongs_to :address

	after_commit :reindex_business


  def reindex_business
    Business.reindex
  end

end
