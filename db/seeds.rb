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

#total_impact_per_category = Array.new(Category.count, 0)
# total_impact_per_category = Hash.new()
#
# def create_impact_entries(product)
#   ActiveRecord::Base.transaction do
#     if product.save
#       ImpactLineItem.all.each do |impact_line_item|
#         product_impact_line_item = product.product_impact_line_items.create(product_id: product.id, impact_line_item_id: impact_line_item.id)
#
#         Category.all.each do |category|
#           # byebug
#           # in form.html.erb, impact_entry has the following HTML impact_entry[<%=impact_line_item.id%>][<%=category.id%>]
#           if impact_line_item.name != "Total Impact"
#             ie = ImpactEntry.create( product_impact_line_item_id: product_impact_line_item.id,
#                                 category_id: category.id,
#                                 value: 1 + rand(10))
#             total_impact_per_category
#           end
#         end
#
#         # sum the Total Impact
#         Category.all.each do |category|
#           if impact_line_item.name == "Total Impact"
#             ImpactEntry.create( product_impact_line_item_id: product_impact_line_item.id,
#                                 category_id: category.id,
#                                 value: total_impact_of_category)
#           end
#         end
#       end
#     end
#   end
# end


def create_impact_entries(product)
  ActiveRecord::Base.transaction do
    if product.save
      ImpactLineItem.all.each do |impact_line_item|
        product_impact_line_item = product.product_impact_line_items.create(product_id: product.id, impact_line_item_id: impact_line_item.id)

        Category.all.each do |category|
          # byebug
          # in form.html.erb, impact_entry has the following HTML impact_entry[<%=impact_line_item.id%>][<%=category.id%>]
          ImpactEntry.create( product_impact_line_item_id: product_impact_line_item.id,
                              category_id: category.id,
                              value: 1 + rand(9))
        end

      end
    end
  end
  product
end


p1 = Product.new(name: "p1", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "1",
                image: File.open(File.join(Rails.root, '/demo_images/p1.png')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com")
create_impact_entries(p1)

p2 = Product.new(name: "p2", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "2",
                image: File.open(File.join(Rails.root, '/demo_images/p2.png')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com")
create_impact_entries(p2)

p3 = Product.new(name: "p3", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "3",
                image: File.open(File.join(Rails.root, '/demo_images/p3.png')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com",
                address: "142 W Hastings St, Vancouver, BC, Canada")
create_impact_entries(p3)

p4 = Product.new(name: "p4", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "4",
                image: File.open(File.join(Rails.root, '/demo_images/p4.png')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com")
create_impact_entries(p4)

p5 = Product.new(name: "p5", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "5",
                image: File.open(File.join(Rails.root, '/demo_images/p5.png')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com")
create_impact_entries(p5)

p6 = Product.new(name: "p6", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "6",
                image: File.open(File.join(Rails.root, '/demo_images/p6.png')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com",
                address: "6138 Bedrock Ct, North Las Vegas, Nevada, USA")
create_impact_entries(p6)

p7 = Product.new(name: "p7", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "7",
                image: File.open(File.join(Rails.root, '/demo_images/p7.png')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com",
                address: "No. 7, Section 5, Xinyi Rd, Xinyi District, Taipei City, Taiwan ")
create_impact_entries(p7)

p8 = Product.new(name: "p8", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "8",
                image: File.open(File.join(Rails.root, '/demo_images/p8.png')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com",
                address: "4-1-2, Hiranomachi, Chuo-ku, Osaka, Japan")
create_impact_entries(p8)

ProductRel.create(parent_id: p1.id, child_id: p3.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: p2.id, child_id: p3.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: p2.id, child_id: p6.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: p3.id, child_id: p7.id, child_quantity: 1+rand(9).floor)
ProductRel.create(parent_id: p3.id, child_id: p8.id, child_quantity: 1+rand(9).floor)

product = Product.new(name: "Clif Bar", user_id: u1.id,
                description: Faker::Hipster.paragraph,
                barcode_type: "UPC_A", barcode: "722252212122",
                image: File.open(File.join(Rails.root, '/demo_images/Clif_Bar.jpeg')),
                contact_email: "codecorefrank@gmail.com",
                details_url: "http://www.example.com")
create_impact_entries(product)

for i in 9..30 do

  p = Product.new(name: Faker::Commerce.product_name, user_id: u1.id,
                  description: Faker::Hipster.paragraph,
                  barcode_type: "UPC_A", barcode: i.to_s,
                  contact_email: "codecorefrank@gmail.com",
                  details_url: "http://www.example.com")
  create_impact_entries(p)

end
