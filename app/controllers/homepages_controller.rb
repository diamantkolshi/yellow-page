class HomepagesController < ApplicationController
  def index
  	@businesses = Business.all.limit(3)
  	@businesses_rate = Business.order(average_rate: :desc).limit(3)
  	@categories = Category.all
  end
end
