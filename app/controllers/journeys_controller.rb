class JourneysController < ApplicationController
    before_action :set_current_traveller

  def index
    if @traveller == nil
      redirect_to new_traveller_session_path
    else
    @journeys = Journey.where(:traveller_id => @traveller.id)
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

  private
  def set_current_traveller
    @traveller = current_traveller
  end

  def allowed_params
    params.require(:journey).permit(:title, :description, :start_date, :end_date)
  end
end
