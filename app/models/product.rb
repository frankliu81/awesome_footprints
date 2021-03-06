class Product < ActiveRecord::Base
  belongs_to :user

  has_many :parent_product_rels, dependent: :destroy, foreign_key: :child_id, class_name: "ProductRel"
  has_many :parents, through: :parent_product_rels, source: :parent

  has_many :child_product_rels, dependent: :destroy, foreign_key: :parent_id, class_name: "ProductRel"
  has_many :children, through: :child_product_rels, source: :child

  has_many :product_impact_line_items, dependent: :destroy
  has_many :impact_line_items, through: :product_impact_line_items

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocode

  def self.search(search_term)
    where(["name ILIKE :term OR description ILIKE :term", {term: "%#{search_term}%"} ])
  end

  def find_product_impact_line_item(impact_line_item)
    product_impact_line_items.find_by_impact_line_item_id(impact_line_item.id)
  end

  # def impact_entries
  #   ImpactEntry.find(:all,
  #              :joins=>" JOIN stores ON Categories.manager_id = managers.id
  #                        JOIN regions ON stores.region_id = regions.id
  #                        JOIN readings ON readings.region_number = regions.number"
  #              :conditions=>"manager.name = 'John Smith' AND regions.number = '1234567'"
  #              :limit=>100)
  # end

  def child_quantity(child)
    child_product_rels.find_by_child_id(child).child_quantity
  end

  # return true if any child product address is present so we can display the map
  def child_product_addresses_present?
    children.each do |child|
      if child.address.present?
        return true
      end
    end
    false
  end

  def children_with_address
    children.where("address IS NOT null")
  end

end
