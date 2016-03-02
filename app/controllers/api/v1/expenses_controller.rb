class Api::V1::ExpensesController < ApplicationController

	def index
		@expenses = current_user.expenses
		render json: @expenses
	end

	def create
  # binding.pry
		expense = Expense.create_from_ember(expense_params)
		category_id = params["expense"]["category_id"].to_i
		expense[:category_id] = category_id
		current_user.expenses << expense
		current_user.save

		render json: expense
	end

	def show
		render json: Expense.find(params[:id])
	end

	def destroy
			expense = Expense.find(params[:id])
			expense.destroy
			render json: expense
	end

	private
	def expense_params
		params.require(:expense).permit(:amount, :note, :user_id, :category_id)
	end


  def category_params
    params.require(:category).permit(:name, :id)
  end

end
