module RoleMacros
  include Sorcery::TestHelpers::Rails

  def for_users_that_can *args
    ::User::ROLES.each do |role|
      if Ability.new(user_with_role(role)).can? *args
        yield role
      else
      end
    end
  end

  def for_users_that_cannot *args
    ::User::ROLES.each do |role|
      if Ability.new(user_with_role(role)).cannot? *args
        yield role
      else
      end
    end
  end

  def user_with_role *roles
    User.new.tap {|user|  user.roles= roles }
  end
end
