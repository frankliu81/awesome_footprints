class CreateImpactLineItems < ActiveRecord::Migration
  def change
    create_table :impact_line_items do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
