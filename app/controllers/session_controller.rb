class SessionController < ApplicationController

  def create
    user = User.find_by(username: user_params[:username])

    if user && user.authenticate(user_params[:password])
      token = SecureRandom.urlsafe_base64

      session[:session_token] = token
      user.update(session_token: token)

      render json: {
        message: "login successful!"
      }
      redirect_to application_home_path
    else
      render json: {
        message: "login failed :-("
      }
      redirect_to root_path
    end
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
