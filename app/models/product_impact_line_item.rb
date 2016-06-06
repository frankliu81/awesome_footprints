class ProductImpactLineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :impact_line_item

  has_many :impact_entries, dependent: :destroy
  has_many :categories, through: :impact_entries

  def find_impact_entry(category)
    #impact_entries.find_by_category_id(category.id)
    #http://stackoverflow.com/questions/37648421/active-record-query-optimizations-for-two-many-to-many-join-models
    # this won't call the DB each time
    impact_entries.find{ |ie| ie.category_id == category.id }
  end

end
