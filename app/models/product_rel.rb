class ProductRel < ActiveRecord::Base
  belongs_to :parent, class_name: "Product", foreign_key: :parent_id
  belongs_to :child, class_name: "Product", foreign_key: :child_id
  # prevent duplication of parent_id and child_id pairs
  validates :parent_id, presence: true
  validates :child_id, presence: true
  validates :parent_id, uniqueness: {scope: :child_id}

  # find a specific parent-child relationship
  def self.find_by_parent_child(parent, child)
    ProductRel.where(parent_id: parent.id)
              .find_by_child_id(child.id)
  end

end
