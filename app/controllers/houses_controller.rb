class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def create
    @house = House.create(house_params)
    @house.owner = current_user
    @house.save
    redirect_to house_path(@house)
  end

  def new
    @house = House.new
  end

  def edit
    @house = House.find(params[:id])
  end

  def show
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    if @house.update_attributes(house_params)
      redirect_to house_path(@house)
    else
      render 'edit'
    end

  end

  def destroy
  end

  private

  def house_params
    params.require(:house).permit(:name, :price_per_night, :city, :max_guests, :pets_allowed)
  end
end
