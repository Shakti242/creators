class StoresController < ApplicationController
  before_action :authenticate_user!
  layout 'application'

  def show
    @store = Store.find_by(user_id: current_user.id)  # Assuming you're finding the store by user_id
    if @store.nil?
      redirect_to root_path, alert: "Store not found"
    end
  end


  def edit
    @store = current_user.store
  end

  def update
    # Ensure user has an account
    account = current_user.account || Account.create(user: current_user)
    # Ensure user has a store
    @store = current_user.store || Store.create(user: current_user, account: account)
    if @store.update(store_params)
      service = StripeAccount.new(account)
      service.update_account_branding
      redirect_to store_path, notice: "Store updated successfully."
    else
      render :edit
    end
  end


  private

  def store_params
    params.require(:store).permit(
      :domain,
      :subdomain,
      :primary_color,
      :secondary_color
    )
  end
end
