require 'spec_helper'

describe "Login" do
  describe "GET /logins" do
    before :each do
      visit login_path
    end

    context "with valid data" do
      let(:password) { 'some_cool_password' }
      let!(:user) { create :user, password: password }

      before :each do
        fill_form email: user.email, password: password
        submit_form
      end

      it 'shows logout option' do
        page.should have_content('Logout')
      end
    end

    context "with invalid data" do
      let(:password) { 'some_cool_password' }
      let!(:user) { create :user, password: password }

      before :each do
        fill_form email: user.email, password: "p#{password}"
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
  end

  def submit_form
    click_button 'Login'
  end
end
