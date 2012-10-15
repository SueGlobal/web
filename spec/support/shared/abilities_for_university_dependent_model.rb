# -*- encoding : utf-8 -*-
shared_examples "abilities for university dependent model" do |model_class|
  let(:resource_class) { model_class }
  let(:resource) { create resource_class.name.underscore }
  let(:university) { resource.university }

  let(:other_resource) { create resource_class.name.underscore }
  let(:other_university) { other_resource.university }

  context "when there is no user" do
    let(:user) { nil }

    it { should be_able_to :read, resource_class }
    it { should_not be_able_to :new, resource }
    it { should_not be_able_to :create, resource }
    it { should_not be_able_to :edit, resource }
    it { should_not be_able_to :update, resource }
    it { should_not be_able_to :destroy, resource }
  end

  context "when it is a simple user" do
    let(:user) { create :user, :simple, :active, university: university }

    it { should be_able_to :read, resource_class }
    it { should be_able_to :new, resource }
    it { should_not be_able_to :new, other_resource }
    it { should be_able_to :create, resource }
    it { should_not be_able_to :create, other_resource }
    it { should be_able_to :edit, resource }
    it { should_not be_able_to :edit, other_resource }
    it { should be_able_to :update, resource }
    it { should_not be_able_to :update, other_resource }
    it { should be_able_to :destroy, resource }
    it { should_not be_able_to :destroy, other_resource }
  end
  context "when it is an admin" do
    let(:user) { create :user, :admin, :active, university: university }


    it { should be_able_to :read, resource_class }
    it { should be_able_to :new, resource }
    it { should be_able_to :new, other_resource }
    it { should be_able_to :create, resource }
    it { should be_able_to :create, other_resource }
    it { should be_able_to :edit, resource }
    it { should be_able_to :edit, other_resource }
    it { should be_able_to :update, resource }
    it { should be_able_to :update, other_resource }
    it { should be_able_to :destroy, resource }
    it { should be_able_to :destroy, other_resource }
  end

  context "when it is god" do
    let(:user) { create :user, :god, :active }

    it { should be_able_to :manage, resource_class }
  end
end
