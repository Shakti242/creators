class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.products.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      service = StripeProduct.new(product_params, @product)
      service.create_product
      redirect_to @product, notice: 'Product created successfully.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :photo, default_price_data: [:currency, :amount])
  end
end
