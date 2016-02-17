class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :amount, :note, :category_id, :user_id
end
