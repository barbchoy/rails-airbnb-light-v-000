class StaysController < ApplicationController
  def create
    @stay = Stay.create(:guest_id => params[:user_id], :house_id => params[:house_id])
    @message = @stay.stay_here(params[:days].to_i)
    redirect_to user_path(@ride.user, :message => @message)
  end
end
