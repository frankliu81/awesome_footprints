class AddGeocodingFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :address, :string
    add_column :products, :longitude, :float
    add_column :products, :latitude, :float
  end
end
