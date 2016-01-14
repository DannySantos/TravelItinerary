class PropertiesController < ApplicationController
  before_action :authenticate_traveller!, :set_current_provider
  
  def index
    if @provider.type != "Provider"
      redirect_to journeys_path
    else
      @properties = Property.where(:provider_id => @provider.id)
    end
  end

  def create
    @property = @provider.properties.build(allowed_params)
    @property.save!
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy!
  end

  def new
  end

  def view_rentals
    @item = Item.find(params[:item_id])
    @properties = Property.search_rentals(@item)
  end

  private
  def allowed_params
    params.require(:property).permit(:provider_id, :description, :address, :country, :title, :img_url)
  end

  def set_current_provider
    @provider = current_traveller
  end
end