class SearchController < ApplicationController
  before_action :business_reindex

  def index
    if params[:query].present?
      @businesses = Business.search(params[:query], suggest: true, page: params[:page], per_page: 10, fields: [:name])
    elsif params[:product].present?
      @businesses = Business.search(params[:product], suggest: true, page: params[:page], per_page: 10 )
    elsif params[:multi].present?
    	multi =  Business.search(params[:multi], fields: [:name, :category_id, :zip_code, :email]).results 
      address = Business.search(params[:address], fields: [:address_name]).results 
      city = Business.search(params[:city], fields: [:city_id]).results

      @businesses = multi & address & city
      as
    end
  end

  def business_reindex
    Business.reindex
  end

end


