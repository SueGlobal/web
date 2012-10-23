# -*- encoding : utf-8 -*-
require "spec_helper"

describe UserActivationMailer do
  let(:password) { "12345554" }
  let(:university) { create :university }
  let(:new_user) { create(:user, password: password, university: university).tap{|x| x.password = password} }

  describe "activation_needed_email" do
    let(:mail) { UserActivationMailer.activation_needed_email new_user }

    it "renders the headers" do
      mail.subject.should eq(I18n.t('mailers.user_activation.activation_needed_email.subject'))
      mail.to.should eq([new_user.email])
      mail.from.should eq([APP_CONFIG[:email_address]])
    end

    it "renders the body" do
      mail.body.encoded.should match(new_user.activation_token)
    end
  end

  describe "activation_success_email" do
    let(:mail) { UserActivationMailer.activation_success_email new_user }

    it "renders the headers" do
      mail.subject.should eq(I18n.t('mailers.user_activation.activation_success_email.subject'))
      mail.to.should eq([new_user.email])
      mail.from.should eq([APP_CONFIG[:email_address]])
    end

    it "renders the body" do
      mail.body.encoded.should match(login_url)
    end
  end

  describe "activation_for_registered_users" do
    let(:mail) { UserActivationMailer.activation_for_registered_users_email new_user }

    it "renders the headers" do
      mail.subject.should eq(I18n.t('mailers.user_activation.activation_for_registered_users_email.subject'))
      mail.to.should eq([new_user.email])
      mail.from.should eq([APP_CONFIG[:email_address]])
    end

    it "renders the body" do
      mail.body.encoded.should match(login_url)
      mail.body.encoded.should match(university.abbreviation)
      mail.body.encoded.should match(new_user.email)
      mail.body.encoded.should match(password)
    end
  end
end
