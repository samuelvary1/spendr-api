class SessionsController < Devise::SessionsController
  def create
    user = User.authenticate(user_params)
    if user
      data = {
        authentication_token: user.authentication_token,
        email: user.email,
      }
      render json: data, status: 201
    end
  end


  private
  def user_params
    params.require(:user).permit(:password, :email)
  end
end
