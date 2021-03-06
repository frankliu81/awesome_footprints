require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :name => "MyString",
      :parent_product_id => 1,
      :user => nil
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_parent_product_id[name=?]", "product[parent_product_id]"

      assert_select "input#product_user_id[name=?]", "product[user_id]"
    end
  end
end
