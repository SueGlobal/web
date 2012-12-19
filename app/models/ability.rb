# -*- encoding : utf-8 -*-
class Ability
  include CanCan::Ability

  UNIVERSITY_DEPENDENT_MODELS = [
    Service, GeneralFrame, AchievedActivity,
    StudentStudy, EmployerStudy, PublicSourceStudy,
    AgreementSourceStudy, DatabaseStudy, OtherStudy]

  ADD_USER_PERMITS = [:add_user, :do_add_user]

  INDEX_RELATED_MODELS = [
    Source, Index, Sample
  ]

  SEGMENTATION_VARIABLE_MODELS = [
     SegmentationVariable, SegmentationVariableValue,
     Segment
  ]

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
    user ||= User.new.tap { |u| u.roles = [:simple] }
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
    can :read, University
    can :evolution, GeneralFrame
    can :read, UNIVERSITY_DEPENDENT_MODELS
    can :read, INDEX_RELATED_MODELS
    cannot :manage, AnnualReport
    can :read, AnnualReport
    cannot :manage, Journal
  end

  def simple_abilities user
    if user.university_id
      can ADD_USER_PERMITS, University, id: user.university_id
      can :read, Journal
      can :manage, UNIVERSITY_DEPENDENT_MODELS , university_id: user.university_id
      can [:edit, :update], University, id: user.university_id
    end
    cannot [:new, :create], University
    can [:read, :update], User, id: user.id
    cannot :index, User
  end

  def admin_abilities user
    can :manage, INDEX_RELATED_MODELS
    can ADD_USER_PERMITS, University
    can :manage, UNIVERSITY_DEPENDENT_MODELS
    can :manage, University
    cannot :destroy, University
    can :manage, User do |other_user|
      !other_user.roles.include?(:god)
    end
    cannot :index, User
    cannot :assign_roles, User do |other_user|
      other_user.roles != [:simple]
    end
    can :manage, SEGMENTATION_VARIABLE_MODELS
    can :manage, [Journal, AnnualReport]
    can :admin, :site
  end

  def god_abilities user
    can :manage, :all
  end
end
