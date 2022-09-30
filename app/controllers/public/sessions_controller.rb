# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]




  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  #def after_sign_up_path_for(resource)
  #  customer_path
  #end

  protected

  def reject_user
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == true)
        redirect_to new_customer_registration_path
        flash[:is_active] = "退会済みです。再度ご登録をしてご利用ください。"
      else
        flash[:is_active] = "項目を入力してください"
      end
    end
  end
end
