class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    if user_signed_in?
      redirect_to '/message_rooms'
    end
  end

  protected

    # permitting username for strong params
    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
