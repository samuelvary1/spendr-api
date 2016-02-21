class Expense < ActiveRecord::Base
	belongs_to :category
	belongs_to :user

	def self.create_from_ember(expense_parameters)
	    expense = Expense.where(
	                  amount: expense_parameters[:amount],
										note: expense_parameters[:note]).first_or_create

	  end
end
