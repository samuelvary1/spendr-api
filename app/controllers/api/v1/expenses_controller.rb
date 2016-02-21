class Api::V1::ExpensesController < ApplicationController

	def index
		
		@expenses = Expense.all
		render json: @expenses
	end

	def create
		expense = Expense.create_from_ember(expense_params)
		render json: expense
	end

	def show
		render json: Expense.find(params[:id])
	end

private
	def expense_params
		params.require(:expense).permit(:amount, :note, :user_id)
	end

end
