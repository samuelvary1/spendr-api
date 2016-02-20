class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :monthly_salary, :password_digest, :category_ids, :expense_ids
end
