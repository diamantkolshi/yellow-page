class SearchController < ApplicationController

  def index
    if params[:query].present?
      @businesses = Business.search(params[:query], suggest: true, page: params[:page], per_page: 10, fields: [:name])
    elsif params[:product].present?
      @businesses = Business.search(params[:product], fields: [:product_name] ,page: params[:page], per_page: 10 )
    elsif params[:multi].present?
    	multi =  Business.search(params[:multi], fields: [:name, :category_name, :zip_code, :email]).results 
      address = Business.search(params[:address], fields: [:address_name]).results 
      city = Business.search(params[:city_id], fields: [:city_id]).results

      @businesses = multi & address & city
    end
    
    if params[:businesses].present?
      @businesses = []
      businesses_filter = Business.where(slug: params[:businesses])
      @open = params[:open] 

    
      
      businesses_filter.each do |business|
        if @open 
          if business.average_rate.between?(params[:rate_min].to_i, params[:rate_max].to_i) && business.open == true
            @businesses << business 
          end
        else
          if business.average_rate.between?(params[:rate_min].to_i, params[:rate_max].to_i) 
            @businesses << business
          end
        end 
      end
      
    end

    if params[:sort].present?
      
      if params[:businesses] != nil
        businesses_select = params[:businesses].split(" ").map {|x| x.to_i }  
        businesses_sorted = Business.where(id: businesses_select.map {|x| x }) 
      end
      
  
      if params[:sort] == "Rate"
        @businesses = businesses_sorted.order(average_rate: :desc)
      elsif params[:sort] == "Name"
        @businesses = businesses_sorted.order(name: :asc)   
      end
    
    end
        
  end

  def filter 
 
    businesses_select = []

    category_name = params[:category]
    city = params[:city].to_i
    open = true if params[:open].present?
    rate_min = params[:rate_min].first.to_i
    rate_max = params[:rate_max].first.to_i
    
    if params[:businesses] != nil
      businesses_search = params[:businesses].split(" ").map {|x| x.to_i }  
      businesses_filter = Business.where(id: businesses_search.map {|x| x }) 
    end    

    businesses_filter = businesses_filter.search(where:{
      category_name: category_name,
      city_id: city
    }).results if category_name.present? && city != 0  
    
    businesses_filter = businesses_filter.search(where:{
      category_name: category_name
    }).results if category_name.present? && city == 0

    businesses_filter = businesses_filter.search(where:{
      city_id: city
    }).results if !category_name.present? && city != 0

    businesses_filter.each do |business|
      if businesses_search.include?(business.id)
        businesses_select << business
      end
    end if businesses_filter != nil   

    redirect_to action: 'index', businesses: businesses_select, open: open, rate_min: rate_min, rate_max: rate_max, category: category_name, city: city.to_i 
  
  end
  

end


