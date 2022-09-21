class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
  end

  private

  def order_params
  params.require(:order).permit(:customer_id, :post_code, :address, :name, :shopping_cost, :payment_method, :total_payment, :status)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :maiking_status)
  end


end
