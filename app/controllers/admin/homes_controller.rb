class Admin::HomesController < ApplicationController

  def top
     @orders = Order.all.order("created_at DESC")
  end

  def order_params
  params.require(:order).permit(:customer_id, :post_code, :address, :name, :shopping_cost, :payment_method, :payment_method, :status)
  end

end
