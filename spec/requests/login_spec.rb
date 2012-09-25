require 'spec_helper'

describe "Login" do
  describe "GET /logins" do

    context "with valid data" do
      let(:password) { 'some_cool_password' }

      context "when user is not yet active" do

        let!(:user) { create :user, :inactive, password: password }

        before :each do
          login_with user.email, password, true
        end

        it "is not logged in" do
          page.should have_content(login_text)
        end
      end

      context "when user is active" do
        let!(:user) { create :user, :active,  password: password }

        context "without being remembered" do
          before :each do
            login_with user.email, password, false
          end

          it 'shows logout option' do
            page.should have_content(logout_text)
          end

          it "does not remember the user" do
            user.reload.remember_me_token.should be_nil
          end
        end

        context "being remembered" do

          before :each do
            login_with user.email, password, true
          end

          it "shows logout option" do
            page.should have_content(logout_text)
          end

          it "gets the user remembered" do
            user.reload.remember_me_token.should_not be_blank
          end
        end
      end
    end

    context "with invalid data" do
      let(:password) { 'some_cool_password' }
      let!(:user) { create :user, :active, password: password }

      before :each do
        login_with user.email, "p#{password}", true
      end

      it 'shows login option' do
        page.should have_content(login_text)
      end
    end
  end
end
