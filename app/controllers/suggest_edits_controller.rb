class SuggestEditsController < ApplicationController
  include SuggestEditsHelper
  before_action :authenticate_user!
  before_action :business_id_exist?, only: "index"


  def index
    @business_suggest_edit = Business.find(params[:id])
    @edit = SuggestEdit.new
  end

  def create
    @update_attribute = check_suggested
    if @update_attribute == false
      send_suggest_in_email
    else
      select_update_fields
      check_update_fields
      send_suggest_in_email
    end    
  end

  private

  def require_params
    params.require(:suggest_edit).permit(:business_closed, :name, :address, :address1, :zip_code, :business_tel, :business_tele, :opening_hours, :website, :facebook, :instagram, :google)
  end

  def business_id_exist?
    unless params[:id]
      redirect_to root_path
    end
  end

end
