class PropertiesController < ApplicationController
  before_action :authenticate_traveller!, :set_current_provider
  
  def index
    @properties = Property.all
  end

  def create
    @property = @provider.properties.build(allowed_params)
    @property.save!
  end

  def new
  end

  def view_rentals
    @item = Item.find(params[:item_id])
    @properties = Property.search_rentals(@item)
  end

  private
  def allowed_params
    params.require(:property).permit(:provider_id, :description, :address, :country, :title)
  end

  def set_current_provider
    @provider = current_traveller
  end
end