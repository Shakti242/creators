class CardholdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @cardholders = current_user.cardholders.all
  end

  def show
    @cardholder = current_user.cardholders.find(params[:id])
  end

  def new
  end

  def create
    @cardholder = current_user.cardholders.new(cardholder_params)
    if @cardholder.save
      # Skip StripeCardholder code for now
      # service = StripeCardholder.new(params, @cardholder)
      # service.create_cardholder
      redirect_to cardholders_path
    else
      render :new
    end
  end

  private

  def cardholder_params
    params.require(:cardholder).permit(:name) # No need to permit :email if you are using current_user's email
  end
end
