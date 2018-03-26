class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :navbar_notifications
  
  protected

  def configure_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def navbar_notifications   
    return if !user_signed_in?

    @notifications_dropdown = current_user.notifications.where(read: false).order('created_at DESC').last(4)
    @available_notifications = current_user.notifications.where(read: false).count
  end

end
