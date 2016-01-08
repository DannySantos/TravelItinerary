class ItemsController < ApplicationController

  def create
    @item = Item.create(allowed_params)
  end

  def new
    @journey = params[:journey_id]
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(allowed_params)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy!
  end

  private
  def allowed_params
    params.require(:item).permit(:journey_id, :description, :destination, :notes, :address)
  end
end
