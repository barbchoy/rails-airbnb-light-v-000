class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def create
    @house = House.create(house_params)
    redirect_to house_path(@house)
  end

  def new
  end

  def edit
  end

  def show
    @house = House.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def house_params
    params.require(:house).permit(:name, :price_per_night, :city, :max_guests, :pets_allowed)
  end
end
