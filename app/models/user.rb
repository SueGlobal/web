# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation

  belongs_to :university

  validates :email,
    uniqueness: true,
    presence: true
  validates :password,
    confirmation: true,
    length: {minimum: 6}, if: :password

  before_validation :ensure_one_role_is_set

  ROLES = [:god, :admin, :simple]
  def roles= roles
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  ROLES.each do |role|
    define_method "#{role}?" do
      ((roles_mask || 0)) & 2**ROLES.index(role) > 0
    end
  end

  def deliver_activation_or_reset_password_instructions!
    if activation_state == 'active'
      deliver_reset_password_instructions!
    else
      send_activation_needed_email!
    end
  end

  private
  def ensure_one_role_is_set
    self.roles = [:simple] if self.roles_mask.zero?
    true
  end
end
