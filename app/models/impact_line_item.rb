class ImpactLineItem < ActiveRecord::Base
  has_many :product_impact_line_items, dependent: :destroy
  has_many :products, through: :product_impact_line_items

  validates :name, uniqueness: true

  # -> is a proc, and the two lines below are equivalent
  #  ImpactLineItem.where(name: "Total Impact").first
  scope :total_impact, -> {where(name: "Total Impact").first}


end
