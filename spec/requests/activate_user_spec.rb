require 'spec_helper'

describe "ActivateUsers" do
  describe "GET /activate_users" do
    let(:user) { create :user, :inactive }

    before :each do
      visit activate_user_url(id: user.activation_token)
    end

    it "shows the login page" do
      current_path.should eq(login_path)
    end

    it "activates the user" do
      user.reload.activation_state.should eq('active')
    end
  end
end
