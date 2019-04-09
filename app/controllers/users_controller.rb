class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(name: params[:user][:name],
        password: params[:user][:password],
        owner: params[:user][:owner])

    log_in(@user)

    if !@user.owner
      redirect_to edit_user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  def show
    redirect_to '/' unless current_user
    @message = params[:message]
    @user = User.find(params[:id])
  end

  def update
    redirect_to user_path(current_user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :balance, :guests, :pets )
  end


end
