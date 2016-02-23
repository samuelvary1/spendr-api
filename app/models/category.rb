class Category < ActiveRecord::Base
	belongs_to :user
	has_many :expenses, dependent: :destroy


	def self.create_from_ember(category_parameters)
	    category = Category.where(
	                  name: category_parameters[:name])
	                  .first_or_create

	end
end
