class ProductRelsController < ApplicationController
  before_action :authenticate_user!

  def create
    parent_id = params[:parent_id]
    child_id = params[:child_id]
    @product_rel = ProductRel.new({parent_id: parent_id,
                      child_id: child_id,
                      child_quantity: params[:child_quantity]})
    #byebug
    @parent_product = Product.find(parent_id)
    @child_product = Product.find(child_id)

    respond_to do |format|
      if @product_rel.save
        flash[:notice] = "Source product added"
        format.html { redirect_to product_path(:parent_id)}
        format.js { render :create_success, locals: {parent_product: @parent_product, child_product: @child_product}}
      else
        flash[:alert] = "Source product not added"
        format.html { render "products/show" }
        format.js { render :create_failure, locals: {parent_product: @parent_product} }
      end
    end


  end

  def destroy
    #byebug
    product_rel = ProductRel.find params[:id]
    parent_product = Product.find product_rel.parent_id
    child_product = Product.find product_rel.child_id
    product_rel.destroy
    respond_to do |format|
      flash.now[:notice] = "Source product removed"
      format.html { redirect_to product_path(parent_product) }
      format.js { render :destroy, locals: {child_product: child_product} }
    end
  end

end
