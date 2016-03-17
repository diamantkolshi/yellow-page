class UploadPhotosController < ApplicationController
  def index
  	@business = Business.all
  end
end
