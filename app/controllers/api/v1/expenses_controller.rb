class Api::V1::ExpensesController < ApplicationController

	def index
		@expenses = Expense.all.where(user_id: current_user.id)
		render json: @expenses
	end

	def create
		expense = Expense.create_from_ember(expense_params)
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

end
