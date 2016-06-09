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

c1 = Category.create(name: "Greenhouse Gases (kg CO2 eq)")
c2 = Category.create(name: "Energy Consumption (kWh)")
c3 = Category.create(name: "Renewable Percentage (%)")
c4 = Category.create(name: "Water Use (L)")
c5 = Category.create(name: "Waste (kg)")

ili1 = ImpactLineItem.create(name: "Source")
ili2 = ImpactLineItem.create(name: "Manufacturing")
ili3 = ImpactLineItem.create(name: "Distribution")
ili4 = ImpactLineItem.create(name: "Use Phase")
ili5 = ImpactLineItem.create(name: "End of Life")
ili6 = ImpactLineItem.create(name: "Total Impact")


def create_impact_entries(product)
  ActiveRecord::Base.transaction do
    if product.save
      total_impact = Hash.new(0)
      ImpactLineItem.all.each do |impact_line_item|
        #byebug
        if impact_line_item.name != "Total Impact" # calculate the Total Impact after other impact_entries have been created
          product_impact_line_item = product.product_impact_line_items.create(product_id: product.id, impact_line_item_id: impact_line_item.id)

          Category.all.each do |category|
            # in form.html.erb, impact_entry has the following HTML impact_entry[<%=impact_line_item.id%>][<%=category.id%>]
              value = 1 + rand(9)
              ImpactEntry.create( product_impact_line_item_id: product_impact_line_item.id,
                                  category_id: category.id,
                                  value: value)
              total_impact[category.name] = total_impact[category.name] + value;
          end
        end
      end

      # do the average for renewable percentage
      total_impact["Renewable Percentage (%)"] = total_impact["Renewable Percentage (%)"] / (ImpactLineItem.count - 1).to_f

      # seed total impact
      #byebug
      product_impact_line_item = product.product_impact_line_items.create(product_id: product.id, impact_line_item_id: ImpactLineItem.total_impact.id)
      Category.all.each do |category|
        ImpactEntry.create( product_impact_line_item_id: product_impact_line_item.id,
                            category_id: category.id,
                            value: total_impact[category.name])
      end

    end
  end
  product
end

clif_bar  = Product.new(name: "Clif Bar", user_id: u1.id,
                description: "Mix of carbohydrates, protein, and fiber makes this a moderate glycemic index food that gives you sustained energy.
                Made with 70-percent organic ingredients.  Free of trans fats, hydrogenated oils, and high fructose corn syrup",
                barcode_type: "UPC_A", barcode: "722252212122",
                image: File.open(File.join(Rails.root, '/demo_images/Clif_Bar.jpeg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com",
                address: "142 W Hastings St, Vancouver, BC, Canada")
create_impact_entries(clif_bar)

p1 = Product.new(name: "Nike Shoes", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "1",
                image: File.open(File.join(Rails.root, '/demo_images/Nike_Shoes.jpg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com")
create_impact_entries(p1)

p2 = Product.new(name: "Codecore T-Shirt", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "2",
                image: File.open(File.join(Rails.root, '/demo_images/CodeCore_Tshirt.jpg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com")
create_impact_entries(p2)

p3 = Product.new(name: "Spalding Basketball", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "3",
                image: File.open(File.join(Rails.root, '/demo_images/Spalding_Basketball.jpg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com",
                address: "142 W Hastings St, Vancouver, BC, Canada")
create_impact_entries(p3)

p4 = Product.new(name: "Backpack", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "4",
                image: File.open(File.join(Rails.root, '/demo_images/Backpack.jpg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com")
create_impact_entries(p4)

p5 = Product.new(name: "Bicycle", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "5",
                image: File.open(File.join(Rails.root, '/demo_images/Bicycle.jpg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com")
create_impact_entries(p5)

p6 = Product.new(name: "Chocolate", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "6",
                image: File.open(File.join(Rails.root, '/demo_images/Chocolate_Chips.jpg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com",
                address: "6138 Bedrock Ct, North Las Vegas, Nevada, USA")
create_impact_entries(p6)

p7 = Product.new(name: "Raisin", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "7",
                image: File.open(File.join(Rails.root, '/demo_images/Raisins.jpg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com",
                address: "No. 7, Section 5, Xinyi Rd, Xinyi District, Taipei City, Taiwan ")
create_impact_entries(p7)

p8 = Product.new(name: "Peanut", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "8",
                image: File.open(File.join(Rails.root, '/demo_images/Peanuts.jpg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com",
                address: "4-1-2, Hiranomachi, Chuo-ku, Osaka, Japan")
create_impact_entries(p8)

ProductRel.create(parent_id: clif_bar.id, child_id: p7.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: clif_bar.id, child_id: p8.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: p1.id, child_id: p3.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: p2.id, child_id: p3.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: p2.id, child_id: p6.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: p3.id, child_id: p7.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: p3.id, child_id: p8.id, child_quantity: 1+rand(9).floor)

for i in 9..30 do
  p = Product.new(name: Faker::Commerce.product_name, user_id: u1.id,
                  description: Faker::Hipster.paragraph,
                  barcode_type: "UPC_A", barcode: i.to_s,
                  contact_email: "codecorefrank@gmail.com",
                  details_url: "http://www.example.com")
  create_impact_entries(p)
end
