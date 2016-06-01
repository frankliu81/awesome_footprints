class ImpactLineItem < ActiveRecord::Base
  has_many :product_line_items, dependent: :destroy
  has_many :products, through: :product_line_items
end
