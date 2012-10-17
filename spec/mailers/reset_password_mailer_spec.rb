# -*- encoding : utf-8 -*-
require "spec_helper"

describe ResetPasswordMailer do
  describe "reset_password_email" do
    let(:token) { "some_cool_token" }
    let(:user) { create :user, :active, reset_password_token: token }
    let(:mail) { ResetPasswordMailer.reset_password_email(user) }

    it "renders the headers" do
      mail.subject.should eq("Reset your password.")
      mail.to.should eq([user.email])
      mail.from.should eq([APP_CONFIG[:email_address]])
    end

    it "renders the body" do
      mail.body.encoded.should match(edit_password_reset_url(id: user.reset_password_token))
    end
  end
end
