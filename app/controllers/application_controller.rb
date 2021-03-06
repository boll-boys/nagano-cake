class ApplicationController < ActionController::Base
   
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
    :last_name,:fist_name,:last_name_kana,:fist_name_kana,:postal_code,:address,:phon_number,:email
    ])
  end
end
