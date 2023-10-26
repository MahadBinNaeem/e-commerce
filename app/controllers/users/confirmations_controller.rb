class Users::ConfirmationsController < Devise::ConfirmationsController
  skip_authorization_check
  def show;
    authorize! :show, @user
    render 'new'
  end
end
