class Api::V1::UsersController < ApplicationController
	skip_before_action :authenticate!, only: :create
	def index
		@users = User.all
		render json: @users
	end

  def show
    render({json: User.find(params[:id])})
  end

  def create
    user = User.create(user_params)
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render nothing: true
  end

  private
  def user_params
    params.require(:user).permit(:username, :monthly_salary, :password, :password_confirmation)
  end
end
