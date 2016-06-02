class AddBarcodeAndDescriptionFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :barcode, :string
    add_column :products, :barcode_type, :string
    add_column :products, :description, :string
    add_index :products, :barcode,                unique: true
  end
end
