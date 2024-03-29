class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters
 
  def create
    if simple_captcha_valid?
      super       
    else   
      build_resource
      @error = "Please re-enter the captcha code"
      render :new                                 
    end               
  end  
  
  protected
 
  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :user_name, :captcha, :captcha_key,
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :user_name,
        :email, :password, :password_confirmation, :current_password)
    end
  end
  
end