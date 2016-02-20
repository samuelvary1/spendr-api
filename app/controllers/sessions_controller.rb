class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def create
    user = User.authenticate(user_params)
    if user
      data = {
        token: user.authentication_token,
        username: user.username
      }
      render json: data, status: 201
    else
      render json: {error: "Bad username or password"}, status: 401
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
