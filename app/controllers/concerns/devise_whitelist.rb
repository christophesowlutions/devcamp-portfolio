module DeviseWhitelist
  extend ActiveSupport::Concern

  included do 
    before_action :configure_permitted_parameters, if: :devise_controller? # This says I want to create a method and have it run anytime you're communicating with devise controller
  end 

  def only_authenticated!
    unless current_user
      flash[:notice] = I18n.t 'devise.failure.unauthenticated'
      return redirect_to root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
  
  