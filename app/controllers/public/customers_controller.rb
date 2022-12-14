class Public::CustomersController < ApplicationController

  def create
    @customer=Customer.new(customer_params)
    @customer.save
  end

  def show
    @customer = current_customer

  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
      flash[:notice] = '更新に成功しました。'
    else
      render customers_edit_path
      flash[:notice] = '更新に失敗しました。'
    end
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,:first_name_kana, :post_code, :address, :telephone_number, :email)
  end

end
