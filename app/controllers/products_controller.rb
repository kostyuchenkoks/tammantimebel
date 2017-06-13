class ProductsController < ApplicationController
  include CurrentCart 
  before_action :set_cart
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :new, :edit, :destroy]

  # GET /products
  # GET /products.json
  def index
    @cart = Cart.find_by!(params[:id])
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @cart = Cart.find_by!(params[:id])
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @cart = Cart.find_by!(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @cart = Cart.find_by!(params[:id])
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Товар был успешно создан.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Продукт был успешно обновлен.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Продукт успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end

    def admin_user
      unless logged_in? && current_user.admin?
        redirect_to(root_url)
      end 
    end    
end
