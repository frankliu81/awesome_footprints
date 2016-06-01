class Product < ActiveRecord::Base
  belongs_to :user

  # self-referential relationship
  # one product can have many children
  # http://stackoverflow.com/questions/18791874/rails-model-has-many-of-itself/18792091#18792091
  belongs_to :parent, :class_name => "Event", :foreign_key => "parent_product_id"
  has_many :child_products, :class_name => "Event", :foreign_key => "parent_product_id"

  has_many :product_impact_line_items, dependent: :destroy
  has_many :impact_line_items, through: :product_line_items

  validates :name, presence: true, uniqueness: true

  def find_product_impact_line_item(impact_line_item)
    product_impact_line_items.find_by_impact_line_item_id(impact_line_item.id)
  end
  
end
