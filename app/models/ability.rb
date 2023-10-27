class Ability
  include CanCan::Ability

  def initialize(user)
    can :new, Users::SessionsController
    can :create, Users::SessionsController
    can :destroy, Users::SessionsController
    can :new, Users::RegistrationsController
    can :create, Users::RegistrationsController
    can :index, WelcomeController
    can :show, User
    can :edit, User
    can :update, User
    can :destroy, User
    can :show, Users::ConfirmationsController
  end

end
