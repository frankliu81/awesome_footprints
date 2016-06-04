class ProductRel < ActiveRecord::Base
  belongs_to :parent, class_name: "Product", foreign_key: :parent_id
  belongs_to :child, class_name: "Product", foreign_key: :child_id
end
