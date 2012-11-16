# -*- encoding : utf-8 -*-
shared_examples "abilities for index related model" do |model_class|
  let(:resource_class) { model_class }

  context "when there is no user" do
    let(:user) { nil }

    it { should be_able_to :read, resource_class }
    it { should_not be_able_to :new, resource_class }
    it { should_not be_able_to :create, resource_class }
    it { should_not be_able_to :edit, resource_class }
    it { should_not be_able_to :update, resource_class }
    it { should_not be_able_to :destroy, resource_class }
  end

  context "when it is a simple user" do
    let(:user) { create :user, :simple, :active }

    it { should be_able_to :read, resource_class }
    it { should_not be_able_to :new, resource_class }
    it { should_not be_able_to :create, resource_class }
    it { should_not be_able_to :edit, resource_class }
    it { should_not be_able_to :update, resource_class }
    it { should_not be_able_to :destroy, resource_class }
  end
  context "when it is an admin" do
    let(:user) { create :user, :admin, :active }


    it { should be_able_to :manage, resource_class }
  end

  context "when it is god" do
    let(:user) { create :user, :god, :active }

    it { should be_able_to :manage, resource_class }
  end
end
