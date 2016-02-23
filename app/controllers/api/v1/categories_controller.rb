class Api::V1::CategoriesController < ApplicationController
	def index
		@categories = Category.all
		render json: @categories
	end

	def create
    category = Category.create_from_ember(category_params)
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
