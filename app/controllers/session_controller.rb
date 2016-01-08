class SessionController < ApplicationController

  def create
    user = User.find_by(username: user_params[:username])

    if user && user.authenticate(user_params[:password])
      token = SecureRandom.urlsafe_base64

      session[:session_token] = token
      user.update(session_token: token)

      # are we going to use flash messages?
      flash[:message] = "You have successfully logged in!"
    else
      # are we going to use flash messages?
      flash[:message] = "Email/password combo does not exist!"
    end

    # might want to redirect somewhere else?
    redirect_to root_path
  end

  def destroy
    log_out!

    redirect_to root_path
  end

  private

  def user_params
    return params.require(:user).permit(:username, :password)
  end

end
