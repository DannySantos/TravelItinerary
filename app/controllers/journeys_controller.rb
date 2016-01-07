class JourneysController < ApplicationController
  def index
    @journeys = Journey.all
  end

  def new
  end

  def create
    @traveller = current_traveller
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
  def allowed_params
    params.require(:journey).permit(:title, :description)
  end
end
