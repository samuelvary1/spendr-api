class SessionsController < ApplicationController
  def create
    user = User.authenticate(user_params)
    if user
      data = {
        authentication_token: user.authentication_token,
        username: user.username,
      }
      render json: data, status: 201
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :monthly_salary, :password, :password_confirmation)
  end
end
