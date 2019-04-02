class SessionsController < ApplicationController


  def new

  end

  def create
    @user = User.find_by(:name => params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Incorrect username and/or password."
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
