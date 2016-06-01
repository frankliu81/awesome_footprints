class ImpactEntry < ActiveRecord::Base
  belongs_to :product_impact_line_item
  belongs_to :category

end
