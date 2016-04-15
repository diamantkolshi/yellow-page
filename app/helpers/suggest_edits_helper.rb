module SuggestEditsHelper
  attr_accessor :suggest_params, :business_params, :work_hours

  def check_suggested
    @business_params = Business.find(params[:id])
    unless require_params[:business_closed] == "1"
      require_params
    else
      false
    end
  end

  def select_update_fields
    @update_attribute.delete_if { |key, value| key == "business_closed" }
    @work_hours =  @update_attribute.select { |key, value| key == "opening_hours" }
    @update_attribute = @update_attribute.select { |key, value| value != "" }
  end

  def check_update_fields
    @update_attribute.each do |key, value|
      if key == "city"
        if @business_params.cities.first.name == @update_attribute[key]
            @update_attribute.delete(key)
        end
      elsif key == "business_tel"
        @business_params.phones.each do |phone|
          if phone.phone_number == @update_attribute[key]
            @update_attribute.delete(key)
          end
        end
      else
        if @business_params[key] == @update_attribute[key]
          @update_attribute.delete(key)
        end
      end
    end
    @update_attribute.merge(@work_hours)  
  end

  def send_suggest_in_email
    if @update_attribute == {}
      flash[:notice] = "Please suggest an update before submitting."
      redirect_to action: "index", id: @business_params.id
    else
      SendMailer.suggest_and_edit(@update_attribute,@business_params,current_user).deliver_now
      flash[:success] = "Thank you for your contribution! Our moderators are currently reviewing your suggestions. Your requested changes should be live shortly."
      redirect_to business_path(@business_params.id)
    end
  end

end
