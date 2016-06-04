class ProductRelsController < ApplicationController
  before_action :authenticate_user!

  def create
    ProductRel.create({parent_id: params[:parent_id],
                      child_id: params[:child_id],
                      child_quantity: params[:child_quantity]})
  end

  def destroy
    #byebug
    product_rel = ProductRel.find params[:id]
    product_rel.destroy
  end

end
