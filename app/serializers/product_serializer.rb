class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_product_id
  has_one :user
end
