# -*- encoding : utf-8 -*-
require 'spec_helper'

describe UniversityRegister do

  let(:university) { create :university }
  let(:register) { UniversityRegister.new university, emails }

  describe "register_users" do

    context "when user is already registered" do
      let!(:user) { create :user }
      let(:emails) { [user.email] }

      it "does not call generate password" do
        register.should_not_receive(:generate_password)
      end

      it "does not creates a user" do
        expect {
          register.register_users
        }.not_to change(User, :count)
      end

      it "does send an email" do
        expect {
          register.register_users
        }.to change{ number_of_emails }.by(1)
      end
    end

    context "when user is not yet registered" do
      let(:password) { '123456' }
      let(:emails) { ['someone@iusetoknow.com'] }

      before(:each) do
        register.should_receive(:generate_password).and_return(password)
      end

      it "creates a user" do
        expect {
          register.register_users
        }.to change(User, :count).by(1)
        expect(User.last.email).to eq(emails.first)
      end

      it "sends only one email" do
        expect{
          register.register_users
        }.to change{number_of_emails}.by(1)
      end

      it "generates a proper email" do
        register.register_users
        last_email.body.should match(password)
        last_email.body.should match(emails.first)
      end
    end
  end

  describe "save" do
    let(:emails) { ['someone@iusetoknow.com'] }

    context "university can be saved" do
      before :each do
        university.should_receive(:save).and_return true
      end

      it "does call register_users" do
        register.should_receive(:register_users)
        register.save.should be_true
      end

    end

    context "university cannot be saved" do
      before :each do
        university.should_receive(:save).and_return false
      end

      it "does not call register_users" do
        register.should_not_receive(:register_users)
        register.save.should be_false
      end
    end
  end
end
