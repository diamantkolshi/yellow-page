class HomepagesController < ApplicationController
  def index
  	@businesses = Business.all.limit(3)
  end
end
