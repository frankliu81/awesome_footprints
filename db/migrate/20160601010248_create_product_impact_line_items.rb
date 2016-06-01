class CreateProductImpactLineItems < ActiveRecord::Migration
  def change
    create_table :product_impact_line_items do |t|
      t.references :product, index: true, foreign_key: true
      t.references :impact_line_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
