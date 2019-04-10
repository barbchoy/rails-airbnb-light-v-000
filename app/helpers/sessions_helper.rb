module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id:session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def signin_by_facebook
    @user = User.find_or_create_by(:uid => auth['uid']) do |u|
    u.name = auth['info']['name']
    u.password = "password"
    u.email = auth['info']['email']
    u.image = auth['info']['image']
    end
  end
end
