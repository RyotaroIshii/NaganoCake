class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.where(customer_id: current_customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.name = @order.name
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = @order.total_payment.to_s(:delimited)
      @order_detail.save
    end

    @cart_items.destroy_all
    redirect_to thanks_order_path
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @order.shopping_cost = 800
    @order.total_payment = @total.to_i + @order.shopping_cost
    @address = Address.find(params[:order][:address_id])

    if params[:order][:select_address] == "0"
        @order.post_code = current_customer.post_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
        @order.post_code = @address.post_code
        @order.address = @address.address
        @order.name = @address.name

    elsif params[:order][:select_address] == "2"
        @order.post_code = params[:order][:post_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    end
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.order("created_at DESC")
  end

  def show
     @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :post_code, :address, :shopping_cost, :total_payment, :payment_method, :status)
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
