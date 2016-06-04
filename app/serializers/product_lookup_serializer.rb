class ProductLookupSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_full_name, :barcode, :barcode_type, :total_impact

  def user_full_name
    object.user.full_name
  end

  def total_impact
    pili = ProductImpactLineItem.where(product: object, impact_line_item: ImpactLineItem.total_impact)
    impact_entries = ImpactEntry.where(product_impact_line_item: pili)

    # doing it with each
    # total_impact_hash = {}
    # impact_entries.each do |ie|
    #  # [{"Greenhouse Gases" => 5.0},
    #  # {"Energy Consumptino" => 3.0}]
    #  total_impact_hash.merge!({ie.category.name =>ie.value})
    # end
    impact_entries.reduce({}) {|acc, ie| acc.merge!({ie.category.name => ie.value}) }




  end






end
