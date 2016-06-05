class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :barcode_type
      t.string :barcode
      t.string :contact_email
      t.string :details_url
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :products, :name, unique: true
    add_index :products, :description
    add_index :products, :barcode, unique: true

  end
end
