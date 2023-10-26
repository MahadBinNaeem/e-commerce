class Users::SessionsController < Devise::SessionsController
  def new
    authorize! :new, Users::SessionsController # Add this line
    super
  end

  def create
	  authorize! :create, Users::SessionsController
	  super
	end

	def destroy
	  authorize! :destroy, Users::SessionsController
	  super
	end

end
