class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :parent_product_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
