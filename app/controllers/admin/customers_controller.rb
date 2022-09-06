class Admin::CustomersController < ApplicationController

  def index
    # @customers = Customer.page(params[:page])
  end

  def show
  end

  def edit
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end

  # def ensure_customer
  #   @customer = Customer.find(params[:id])
  # end
end
