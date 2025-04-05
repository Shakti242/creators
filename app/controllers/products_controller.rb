class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.products.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      # No need to call StripeProduct or anything related to Stripe.
      # You can add any additional logic here, such as handling the image or other product actions.

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
    params.require(:product).permit(:name, :description, :photo)
  end
end
