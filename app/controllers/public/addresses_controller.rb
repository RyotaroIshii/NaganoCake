class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to address_path

  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to address_path
    flash[:notice] = '更新に成功しました'
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to address_path
    flash[:notice] = '正常に削除されました'
  end

  private

  def address_params
    params.require(:address).permit(:name,:post_code,:address, :customer_id)
  end


end
