class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :monthly_salary, :password_digest, :category_ids, :expense_ids
end
