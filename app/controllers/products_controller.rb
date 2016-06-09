class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :lookup, :autocomplete_name, :search]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    #@products = Product.all
    @products = Product.order('created_at ASC').page(params[:page]).per(12)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    #@product_impact_line_items = @product.product_impact_line_items.includes(:impact_line_item, :impact_entries)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def lookup
    barcode = params[:barcode]
    barcode_type = params[:barcode_type]
    scanned_product = Product.where(barcode_type: barcode_type, barcode: barcode).first
    respond_to do |format|
      format.json { render json: scanned_product, serializer: ProductLookupSerializer }
    end
  end

  def search
    @products = Product.search(params[:search]).page(params[:page]).per(12)
    render :index
  end

  def autocomplete_name
    @products = Product.order(:name).where("name ILIKE ?", "%#{params[:term]}%")
    respond_to do |format|
      #byebug
      format.html
      format.json {
        render json: @products.map{|p| {label: p.name, value: p.id} }.to_json
      }
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    #byebug
    params.require(:product).permit(:name, :parent_product_id, :user_id)
    @product = Product.new(product_params)

    # set up associations
    @product.user = current_user

    ActiveRecord::Base.transaction do

      respond_to do |format|
        if @product.save

          ImpactLineItem.all.each do |impact_line_item|
              product_impact_line_item = @product.product_impact_line_items.create(product_id: @product.id, impact_line_item_id: impact_line_item.id)

              Category.all.each do |category|
                # byebug
                # in form.html.erb, impact_entry has the following HTML impact_entry[<%=impact_line_item.id%>][<%=category.id%>]
                ImpactEntry.create( product_impact_line_item_id: product_impact_line_item.id,
                                    category_id: category.id,
                                    value: params[:impact_entry][impact_line_item.id.to_s][category.id.to_s])
              end

          end

          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render json: @product, status: :created }
        else
          format.html { render action: 'new' }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update

    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @product.update(product_params)

          ImpactLineItem.all.each do |impact_line_item|
            product_impact_line_item = @product.product_impact_line_items.find_by_impact_line_item_id(impact_line_item.id)

            Category.all.each do |category|
                impact_entry = product_impact_line_item.find_impact_entry(category)
                impact_entry.update( value: params[:impact_entry][impact_line_item.id.to_s][category.id.to_s])
            end
          end

          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      #@product = Product.find params[:id]
      @product = Product.where(id: params[:id]).includes(
        {product_impact_line_items: [:impact_line_item, :impact_entries]}).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :barcode_type, :barcode, :image, :address, :user_id)
    end
end
