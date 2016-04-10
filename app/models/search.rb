class Search < ActiveRecord::Base

	def self.advanced_search(params)
		cate = Category.find(params[:category][:category_id])
		@select_businesses = cate.businesses
	
		# unless params[:city].present?
		# 	city = City.where("name like ?","%#{params[:city]}%") 
  #   	@select_businesses << city.first.businesses
  #   end    
    
  #   @select_businesses.uniq

	end

end