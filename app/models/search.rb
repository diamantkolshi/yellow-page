class Search < ActiveRecord::Base

	def self.advanced_search(params)
		cate = Category.find(params[:category][:category_id])
		cate.businesses
		#advanced = Business.where("name like ?", "%#{params[:business]}%")
	end

end
