class UsersController < ApplicationController
	before_action :set_user, only: %w[show edit update destroy]

	def index
		@user = User.all
	end

	def show;end

	def edit
		@roles = Role.all
	end

	def update
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, role_ids: [])
	end

	def set_user
    @user = User.find(params[:id])
  end

end
