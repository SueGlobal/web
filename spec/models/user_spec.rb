require 'spec_helper'

describe User do
  subject { create :user }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }

  it { should validate_confirmation_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }

  describe '#roles=' do
    it "sets simple role if none is given" do
      create(:user).roles.should include(:simple)
    end

    it "does not add unknown roles" do
      user = build(:user)
      user.roles = [:something_something_dark_side]
      user.save
      user.roles.should include(:simple)
      user.roles.should_not include(:something_something_dark_side)
    end

    it "adds several roles if asked to" do
      user = build(:user)
      user.roles = [:god, :admin]
      user.save
      user.roles.should include(:admin)
      user.roles.should include(:god)
      user.roles.should_not include(:simple)
    end
  end
end
