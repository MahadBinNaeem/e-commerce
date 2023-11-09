class WelcomeController < ApplicationController
  def index
    @users = User.all
    if current_user.admin?
      render 'welcome/index_admin'
    elsif current_user.staff?
      render 'welcome/index_staff'
    else
      render 'welcome/index_customer'
    end
  end
end
