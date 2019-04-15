class StaysController < ApplicationController
  def create
    @stay = Stay.create(:guest_id => params[:guest_id], :house_id => params[:house_id])
    @message = @stay.stay_at_this_house(params[:days].to_i)
    redirect_to user_path(@stay.guest, :message => @message, :house => @stay.house)
  end
end
