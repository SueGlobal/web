class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :email, :password, :password_confirmation

  validates :email,
    uniqueness: true,
    presence: true
  validates :password,
    confirmation: true,
    length: {minimum: 6}, if: :password
  validates :username,
    presence: true
end
