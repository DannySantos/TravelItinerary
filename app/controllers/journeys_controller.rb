class JourneysController < ApplicationController
  def index
  end

  def new
  end

  def create
    @journey = Journey.new(allowed_params)
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
