# -*- encoding : utf-8 -*-
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

  it { should belong_to(:university) }

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

  describe "#simple?" do
    it "returns true if user is only simple" do
      create(:user, roles: [:simple]).should be_simple
    end

    it "returns true if user is simple and something more" do
      create(:user, roles: [:simple, :god]).should be_simple
    end

    it "returns false if it has no simple role" do
      create(:user, roles: [:god]).should_not be_simple
    end
  end

  describe "#admin?" do
    it "returns true if user is only admin" do
      create(:user, roles: [:admin]).should be_admin
    end

    it "returns true if user is admin and something more" do
      create(:user, roles: [:admin, :god]).should be_admin
    end

    it "returns false if it has no admin role" do
      create(:user, roles: [:god]).should_not be_admin
    end
  end

  describe "#god?" do
    it "returns true if user is only god" do
      create(:user, roles: [:god]).should be_god
    end

    it "returns true if user is god and something more" do
      create(:user, roles: [:admin, :god]).should be_god
    end

    it "returns false if it has no god role" do
      create(:user, roles: [:admin]).should_not be_god
    end
  end

  describe "#deliver_activation_or_reset_password_instructions!" do

    context "user is active" do
      it "calls super" do
        user = create :user, :active
        user.should_receive :deliver_reset_password_instructions!
        user.deliver_activation_or_reset_password_instructions!
      end
    end

    context "user is inactive" do
      it "calls send_activation_needed_email!" do
        user = create :user, :inactive
        user.should_receive :send_activation_needed_email!
        user.deliver_activation_or_reset_password_instructions!
      end
    end
  end
end
