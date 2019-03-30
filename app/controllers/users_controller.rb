class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(name: params[:user][:name],
        password: params[:user][:password],
        budget: params[:user][:budget],
        guests: params[:user][:guests],
        admin: params[:user][:owner])
    log_in(@user)
    redirect_to user_path(@user)
  end

  def show
    redirect_to '/' unless current_user
    @message = params[:message]
    @user = User.find(params[:id])
  end

  def update
    redirect_to user_path(current_user)
  end
end
