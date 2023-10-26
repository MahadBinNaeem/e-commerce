class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  def new
    authorize! :new, Users::RegistrationsController
    super
  end

  def create
    authorize! :create, Users::RegistrationsController
    super
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
