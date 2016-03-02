class Api::V1::CategoriesController < ApplicationController
	def index
		@categories = current_user.categories
		render json: @categories
	end

	def create
    category = Category.create_from_ember(category_params)
		current_user.categories << category
		current_user.save
    render json: category
	end

  def show

    render json: Category.find(params[:id])
  end

	def destroy
		category = Category.find(params[:id])
		category.destroy
		render json: category
	end

private
  def category_params
    params.require(:category).permit(:name, :user_id)
  end

end
