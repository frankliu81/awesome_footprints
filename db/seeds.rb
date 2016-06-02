# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(first_name: 'Frank', last_name: 'Liu',
              email: 'frankliu81@gmail.com', password: 'bububu',
              password_confirmation: 'bububu', confirmed_at: Time.now)

c1 = Category.create(name: "Greenhouse Gases")
c2 = Category.create(name: "Energy Consumption")
c3 = Category.create(name: "Renewable Percentage")
c4 = Category.create(name: "Water Use")
c5 = Category.create(name: "Waste")

ili1 = ImpactLineItem.create(name: "Total Impact")
ili2 = ImpactLineItem.create(name: "Source")
ili3 = ImpactLineItem.create(name: "Manufacturing")
ili4 = ImpactLineItem.create(name: "Distribution")
ili5 = ImpactLineItem.create(name: "Use Phase")
ili6 = ImpactLineItem.create(name: "End of Life")

product = Product.new(name: "Clif Bar", user: u1, barcode_type: "UPC_A", barcode: "722252212122")

ActiveRecord::Base.transaction do
  if product.save
    ImpactLineItem.all.each do |impact_line_item|
      if impact_line_item != "created_at" && impact_line_item != "updated_at"
        product_impact_line_item = product.product_impact_line_items.create(product_id: product.id, impact_line_item_id: impact_line_item.id)

        Category.all.each do |category|
          if category != "created_at" && category != "updated_at"
            # byebug
            # in form.html.erb, impact_entry has the following HTML impact_entry[<%=impact_line_item.id%>][<%=category.id%>]
            ImpactEntry.create( product_impact_line_item_id: product_impact_line_item.id,
                                category_id: category.id,
                                value: 1 + rand(10))
          end
        end
      end
    end
  end
end
