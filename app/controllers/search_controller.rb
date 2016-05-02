class SearchController < ApplicationController

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
    end
    
    if params[:businesses].present?
      @businesses = Business.where(slug: params[:businesses])
      @open = params[:open]
    end
        
  end

  def filter  
    category_name = params[:category]
    city = params[:city].to_i
    @open = true if params[:open].present?
    @rate = params[:rate] if params[:rate].present?
    
    @businesses = Business.search(where:{
      category_name: category_name,
      city_id: city
    }).results    
    
    asda
    redirect_to action: 'index', businesses: @businesses, open: @open, rate: @rate
  end
end


