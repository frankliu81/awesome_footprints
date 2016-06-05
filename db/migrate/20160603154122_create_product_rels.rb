class CreateProductRels < ActiveRecord::Migration
  def change
    create_table :product_rels do |t|
      t.integer :parent_id
      t.integer :child_id
      t.integer :child_quantity

      t.timestamps null: false
    end
    
  end
end
