FactoryGirl.define do
  factory :impact_entry do
    value 1.5
    unit "MyString"
    product_impact_line_item nil
    category nil
  end
end
