require "spec_helper"

describe UserActivationMailer do
  let(:new_user) { create :user }

  describe "activation_needed_email" do
    let(:mail) { UserActivationMailer.activation_needed_email new_user }

    it "renders the headers" do
      mail.subject.should eq("Activate your account.")
      mail.to.should eq([new_user.email])
      mail.from.should eq(["sue-global@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(new_user.activation_token)
    end
  end

  describe "activation_success_email" do
    let(:mail) { UserActivationMailer.activation_success_email new_user }

    it "renders the headers" do
      mail.subject.should eq("Account activated.")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["sue-global@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(login_url)
    end
  end

end
