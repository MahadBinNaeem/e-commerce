class Users::ConfirmationsController < Devise::ConfirmationsController
  skip_authorization_check
  def show;end
end
