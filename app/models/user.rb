class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :email, :password, :password_confirmation

  validates :email,
    uniqueness: true,
    presence: true
  validates :password,
    presence: true,
    confirmation: true,
    length: {minimum: 6}
  validates :username,
    presence: true
end
