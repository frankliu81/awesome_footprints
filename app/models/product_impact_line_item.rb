class ProductImpactLineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :impact_line_item

  has_many :impact_entries, dependent: :destroy
  has_many :categories, through: :impact_entries

end
