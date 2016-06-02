class ProductSerializer < ActiveModel::Serializer
  #attributes :id, :name, :parent_product_id, :hello
  attributes :id, :name
  has_one :user
  has_many :product_impact_line_items

  # def hello
  #   "world"
  # end

end
