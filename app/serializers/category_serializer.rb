class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :expense_ids
end
