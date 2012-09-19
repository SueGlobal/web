require "spec_helper"
require "cancan/matchers"

describe Ability do
  subject { ability }
  let(:ability) { Ability.new user }

  context "when it is a simple registered user" do
    let(:user) { create :simple_user }
    let(:other_user) { create :user }

    it { should be_able_to :read, user }
    it { should be_able_to :update, user }
    it { should_not be_able_to :destroy, user }
    it { should_not be_able_to :create, User }
    it { should_not be_able_to :read, other_user }
    it { should_not be_able_to :update, other_user }
    it { should_not be_able_to :update, create(:admin_user) }
    it { should_not be_able_to :update, create(:god_user) }
    it { should_not be_able_to :destroy, other_user }
  end

  context "when it is an admin user" do
    let(:user) { create :admin_user }
    let(:other_user) { create :simple_user }
    let(:other_admin_user) { create :admin_user }
    let(:god_user) { create :god_user }

    [:show, :new, :create, :edit, :update].each do |action|
      it { should be_able_to action, user }
      it { should be_able_to action, other_user }
      it { should be_able_to action, other_admin_user }
      it { should_not be_able_to  action, god_user}
    end
    it { should_not be_able_to :index, User }
    it { should be_able_to :assign_roles, other_user }
    it { should_not be_able_to :assign_roles, other_admin_user }
    it { should_not be_able_to :assign_roles, god_user }
  end

  context "when it is god" do
    let(:user) { create :god_user }

    it { should be_able_to :manage, :all }
  end
end
