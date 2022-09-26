class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @total_amount = 0
    @item = Item.find(params[:cart_item][:item_id])

    if current_customer.cart_items.exists?(item_id: @item.id)
      @cart_item = current_customer.cart_items.find_by(item_id: @item.id)
      @total_amount = @cart_item.amount + params[:cart_item][:amount].to_i
      @cart_item.update(amount: @total_amount)
      redirect_to cart_path
    else
      @cart_item.save
      redirect_to cart_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:is_active, :genre_id, :image)
  end

end
