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
ili2 = ImpactLineItem.create(name: "Total Source")
ili3 = ImpactLineItem.create(name: "Source")
ili4 = ImpactLineItem.create(name: "Manufacturing")
ili5 = ImpactLineItem.create(name: "Distribution")
ili6 = ImpactLineItem.create(name: "Use Phase")
ili7 = ImpactLineItem.create(name: "End of Life")
