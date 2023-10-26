class WelcomeController < ApplicationController
  def index
    authorize! :index, WelcomeController
    @users =User.all
  end

  def show
    @user=User.find(params[:id])
  end 
end
