class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :nickname, :photo ])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :nickname, :photo ])
  end

    helper_method :current_user, :logged_in?

def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

def logged_in?
    !!current_user
  end
end
