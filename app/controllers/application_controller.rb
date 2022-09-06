class ApplicationController < ActionController::Base
  # before_action :authenticate_customer!, except: [:top, :about]
  # before_action :authenticate_admin!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Customer
  #     customers_path
  #   when Admin
  #     admin_path
  #   end
  # end

  # def after_sign_out_path_for(resource)
  #   case resource
  #   when Customer
  #     root_path
  #   when Admin
  #     new_admin_session_path
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :telephone_number ])
  end
end
