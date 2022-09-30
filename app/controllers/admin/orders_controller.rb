class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.status == "confirmation"
      @order_details.update_all(making_status: "waiting")
    end
    redirect_to admin_show_order_path
  end

  private

  def order_params
  params.require(:order).permit(:customer_id, :post_code, :address, :name, :shopping_cost, :payment_method, :total_payment, :status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :maiking_status)
  end


end
