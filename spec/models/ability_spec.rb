# -*- encoding : utf-8 -*-
require "spec_helper"
require "cancan/matchers"

describe Ability do
  subject { ability }
  let(:ability) { Ability.new user }

  describe 'regarding site' do
    context "when there is no user" do
      let(:user) { nil }
      it { should_not be_able_to :admin, :site }
    end
    context "when it is a simple registered user" do
      let(:user) { create :user, :simple }
      it { should_not be_able_to :admin, :site }
    end
    context "when it is an admin user" do
      let(:user) { create :user, :admin }
      it { should be_able_to :admin, :site }
    end
    context "when it is god" do
      let(:user) { create :user, :god }
      it { should be_able_to :admin, :site }
    end
  end

  describe 'regarding users' do
    context "when there is no user" do
      let(:user) { nil }
      let(:other_user) { create :user }

      it { should_not be_able_to :destroy, user }
      it { should_not be_able_to :create, User }
      it { should_not be_able_to :read, other_user }
      it { should_not be_able_to :update, other_user }
      it { should_not be_able_to :update, create(:admin_user) }
      it { should_not be_able_to :update, create(:god_user) }
      it { should_not be_able_to :destroy, other_user }
    end

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

  describe 'regarding universities' do
    context "when there is no user" do
      let(:user) { nil }
      let(:university) { create :university }

      it { should_not be_able_to :edit, university }
      it { should_not be_able_to :update, university }
      it { should be_able_to :read, University }
      it { should_not be_able_to :destroy, University }
      it { should_not be_able_to :create, University }
      it { should_not be_able_to :new, University }
      it { should_not be_able_to :add_user, University }
      it { should_not be_able_to :do_add_user, University }
    end

    context "when it is a simple user" do
      let(:university) { create :university }
      let(:other_university) { create :university }
      let(:user) { create :simple_user, :active, university: university }

      it { should be_able_to :edit, university }
      it { should be_able_to :update, university }
      it { should be_able_to :read, University }
      it { should be_able_to :add_user, university }
      it { should be_able_to :do_add_user, university }
      it { should_not be_able_to :destroy, University }
      it { should_not be_able_to :create, University }
      it { should_not be_able_to :new, University }
      it { should_not be_able_to :edit, other_university }
      it { should_not be_able_to :update, other_university }
      it { should_not be_able_to :add_user, other_university }
      it { should_not be_able_to :do_add_user, other_university }
    end

    context "when an admin" do
      let(:user) { create :admin_user, :active }

      it { should be_able_to :read, University }
      it { should be_able_to :new, University }
      it { should be_able_to :create, University }
      it { should be_able_to :edit, University }
      it { should be_able_to :update, University }
      it { should be_able_to :add_user, University }
      it { should be_able_to :do_add_user, University }
      it { should_not be_able_to :destroy, University }
    end

    context "when a god" do
      let(:user) { create :god_user, :active }

      it { should be_able_to :read, University }
      it { should be_able_to :new, University }
      it { should be_able_to :create, University }
      it { should be_able_to :edit, University }
      it { should be_able_to :update, University }
      it { should be_able_to :destroy, University }
      it { should be_able_to :add_user, University }
      it { should be_able_to :do_add_user, University }
    end
  end

  context "regarding services" do
    include_examples "abilities for university dependent model", Service
  end

  context "regarding general frames" do
    include_examples "abilities for university dependent model", GeneralFrame
  end

  context "regarding achieved activities" do
    include_examples "abilities for university dependent model", AchievedActivity
  end

  context "regarding student studies" do
    include_examples "abilities for university dependent model", StudentStudy
  end

  context "regarding employer studies" do
    include_examples "abilities for university dependent model", EmployerStudy
  end

  context "regarding public source studies" do
    include_examples "abilities for university dependent model", PublicSourceStudy
  end

  context "regarding agreement source studies" do
    include_examples "abilities for university dependent model", AgreementSourceStudy
  end

  context "regarding database studies" do
    include_examples "abilities for university dependent model", DatabaseStudy
  end

  context "regarding other studies" do
    include_examples "abilities for university dependent model", OtherStudy
  end

  context "regarding sources" do
    include_examples "abilities for index related model", Source
  end
end
