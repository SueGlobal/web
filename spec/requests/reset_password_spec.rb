require 'spec_helper'

describe "ResetPasswords" do

  context "when requesting a new password" do
    let(:user) { create :user, :active }

    it "sends an email" do
      lambda {
        visit login_path
        fill_in 'forgot-password-email', with: user.email
        click_button 'forgot-password-submit'
      }.should change { number_of_emails }
    end
  end

  context "when visiting the reset password page" do
    let(:user) { create :user, :active, :reset_password }
    def fill_and_submit_reset_password_form
      visit edit_password_reset_path(user.reset_password_token)
      fill_in 'user[password]', with: 'new_password'
      fill_in 'user[password_confirmation]', with: 'new_password'
      click_on 'Reset password' # TODO: frágil
    end

    it "changes the password" do
      lambda{
        fill_and_submit_reset_password_form
      }.should change { user.reload.crypted_password }
    end

    it "redirects to root" do
      fill_and_submit_reset_password_form
      current_path.should == login_path
    end
  end
end
