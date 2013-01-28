class Roles
  include ::Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_reader :user

  attribute :simple, Boolean
  attribute :admin, Boolean
  attribute :god, Boolean


  def user= user
   @user = user
   self.simple = user.simple? if simple.nil?
   self.admin = user.admin? if admin.nil?
   self.god = user.god? if god.nil?
  end

  def persisted?
    false
  end

  def save
    persist!
  end

  def roles_array
    [:simple, :admin, :god].find_all { |x| self.send("#{x}?") }
  end

  class << self

    def from_user(user, *args)
      new(*args).tap do |roles|
        roles.user = user
      end
    end
  end

  private

  def persist!
    user.roles = roles_array
    user.save!
  end
end