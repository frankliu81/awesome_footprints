class CreateImpactEntries < ActiveRecord::Migration
  def change
    create_table :impact_entries do |t|
      t.float :value, default: 0
      t.string :unit, default: ""
      t.references :product_impact_line_item, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
