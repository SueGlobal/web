require 'spec_helper'

describe "BruteForceProtections" do

  LOGIN_RETRIES_AMOUNT_LIMIT = 10
  describe 'lock' do
    let!(:user) { create :user, :active, failed_logins_count: LOGIN_RETRIES_AMOUNT_LIMIT - 1 }

    it "locks the user when reaching maximum retries limit" do
      login_with user.email, "p#{user.password}"

      user.reload.lock_expires_at.should_not be_nil
    end
  end

  describe 'unlock' do
    let(:password) { "some_cool_password" }
    let!(:user) { create :user, :active, :locked, password: password  }

    it "unlocks after some time has passed" do
      Timecop.freeze(Time.now + 11.minutes) do
        login_with user.email, password
        page.should have_content(logout_text)
        user.reload.lock_expires_at.should be_nil
      end
    end

    it "does not login if time has not passed yet" do
      Timecop.freeze(user.lock_expires_at - 10.minutes) do
        login_with user.email, password
        page.should have_content(login_text)
        user.reload.lock_expires_at.should_not be_nil
      end
    end
  end
end
