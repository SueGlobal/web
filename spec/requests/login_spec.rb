require 'spec_helper'

describe "Login" do
  describe "GET /logins" do
    before :each do
      visit login_path
    end

    context "with valid data" do
      let(:password) { 'some_cool_password' }

      context "when user is not yet active" do

        let!(:user) { create :user, :inactive, password: password }

        before :each do
          fill_form email: user.email, password: password, remember_me: true
          submit_form
        end

        it "is not logged in" do
          page.should have_content("Login")
        end
      end

      context "when user is active" do
        let!(:user) { create :user, :active,  password: password }

        context "without being remembered" do
          before :each do
            fill_form email: user.email, password: password, remember_me: false
            submit_form
          end

          it 'shows logout option' do
            page.should have_content('Logout')
          end

          it "does not remember the user" do
            user.reload.remember_me_token.should be_nil
          end
        end

        context "being remembered" do

          before :each do
            fill_form email: user.email, password: password, remember_me: true
            submit_form
          end

          it "shows logout option" do
            page.should have_content('Logout')
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
        fill_form email: user.email, password: "p#{password}", remember_me: true
        submit_form
      end

      it 'shows login option' do
        page.should have_content('Login')
      end
    end
  end

  def fill_form data
    fill_in 'Email', with: data[:email]
    fill_in 'Password', with: data[:password]
    if data[:remember_me]
      check 'remember_me'
    else
      uncheck 'remember_me'
    end
  end

  def submit_form
    click_button 'Login'
  end
end
