class ImpactLineItem < ActiveRecord::Base
  has_many :product_impact_line_items, dependent: :destroy
  has_many :products, through: :product_impact_line_items

  scope :total_impact, -> {where(name: "Total Impact").first}
  #  ImpactLineItem.where(name: "Total Impact")

end
