class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in (current) user. For example:
    #
    #   if user
    #     can :access, :all
    #   else
    #     can :access, :home
    #     can :create, [:users, :sessions]
    #   end
    #
    # Here if there is a user he will be able to perform any action on any controller.
    # If someone is not logged in he can only access the home, users, and sessions controllers.
    #
    # The first argument to `can` is the action the user can perform. The second argument
    # is the controller name they can perform that action on. You can pass :access and :all
    # to represent any action and controller respectively. Passing an array to either of
    # these will grant permission on each item in the array.
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    basic_abilities
    return unless user
    roles = user.roles
    simple_abilities user
    return unless roles.include?(:admin) || roles.include?(:god)
    admin_abilities user
    return unless roles.include?(:god)
    god_abilities user
  end

  def basic_abilities
  end

  def simple_abilities user
    can [:read, :update], :users, id: user.id
  end

  def admin_abilities user
    can :manage, :users do |user|
      !user.roles.include?(:god)
    end
    can :assign_roles, :users do |user|
      user.roles == [:simple]
    end
  end

  def god_abilities user
    can :manage, :all
  end
end
