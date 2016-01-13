class JourneysController < ApplicationController
    before_action :authenticate_traveller!, :set_current_traveller

  def index
      @journey_menu_items = Journey.where(:traveller_id => @traveller.id)

      if params[:id] == nil && @traveller.journeys.count != 0
        @journey = Journey.where(:traveller_id => @traveller.id).first
        items_to_json
      else
        @journey = Journey.where(:traveller_id => @traveller.id, :id => params[:id])
        items_to_json
      end
  end

  def new
  end

  def create
    @journey = @traveller.journeys.build(allowed_params)
    if @journey.save
      flash[:notice] = "Journey created"
      redirect_to journeys_path
      else
      flash[:notice] = "Please fill out all the fields"
      redirect_to new_journey_path
    end
  end

  def map
  end

  private
  def items_to_json
      if @journey.respond_to? :items
        if @journey.items != 0     
          @items_json = @journey.items.to_json
        end
      end
  end
  def set_current_traveller
    @traveller = current_traveller
  end

  def allowed_params
    params.require(:journey).permit(:title, :description, :start_date, :end_date)
  end
end
