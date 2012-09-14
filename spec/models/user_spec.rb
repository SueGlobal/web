require 'spec_helper'

describe User do
  subject { create :user }
  it { should allow_mass_assignment_of(:username) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }

  it { should validate_confirmation_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }
end
