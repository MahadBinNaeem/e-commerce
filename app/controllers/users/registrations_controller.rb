class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    super do |user|
      user.roles << Role.find_by(name: 'customer')
    end

  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    params[:user][:role] = 'customer' if params[:user][:role].blank?
  end
  
end
