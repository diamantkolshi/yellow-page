class SearchController < ApplicationController

  def index
    if params[:query].present?
      @businesses = Business.search(params[:query], suggest: true, page: params[:page], per_page: 10, fields: [:name])
    elsif params[:product].present?
      @businesses = Business.search(params[:product], fields: [:product_name] ,page: params[:page], per_page: 10 )
    elsif params[:multi].present?
    	multi =  Business.search(params[:multi], fields: [:name, :category_name, :zip_code, :email]).results 
      address = Business.search(params[:address], fields: [:address_name]).results 
      city = Business.search(params[:city], fields: [:city_id]).results

      @businesses = multi & address & city
    end
    
    if params[:businesses].present?
      @businesses = []
      businesses_filter = Business.where(slug: params[:businesses])
      @open = params[:open] 

      businesses_filter.each do |business|
        if business.average_rate.between?(params[:rate_min].to_i, params[:rate_max].to_i) 
          @businesses << business 
        end
      end
    end
        
  end

  def filter 
    category_name = params[:category]
    city = params[:city].to_i
    open = true if params[:open].present?
    rate_min = params[:rate_min].first.to_i
    rate_max = params[:rate_max].first.to_i

    

    businesses = Business.search(where:{
      category_name: category_name,
      city_id: city
    }).results    
    

    redirect_to action: 'index', businesses: businesses, open: open, rate_min: rate_min, rate_max: rate_max 
  end

  def aggregations
    @businesses = Business.search( where: {
      category_name: params[:name]
      })
  end 
end


