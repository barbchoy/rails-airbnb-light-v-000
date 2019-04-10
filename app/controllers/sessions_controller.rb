class SessionsController < ApplicationController

  def new
    @non_oauth_users = User.select{|p| !p.uid}
  end

  def create
    @user = User.find_by(:name => params[:user_name])

    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to user_path(@user)
    elsif !@user && @user = signin_by_facebook
      log_in(@user)
      redirect_to user_path(@user)
    else  flash[:message] = "Incorrect username and/or password."
      redirect_to signin_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
