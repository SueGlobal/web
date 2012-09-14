require 'spec_helper'

describe "Logins" do
  describe "GET /signup" do
    before :each do
      visit signup_path
    end

    it "shows a textfield" do
      page.should have_xpath("//input[@type='text']")
    end

    it "shows a textfield for email, password and password confirmation" do
      [:email, :password, :password_confirmation].each do |field|
        page.should have_xpath("//input[@name='user[#{field.to_s}]']")
      end
    end

    context "with valid data" do
      before :each do
        @user_attrs = attributes_for :user
        fill_in 'Email', with: @user_attrs[:email]
        fill_in 'Password', with: @user_attrs[:password]
        fill_in 'Password confirmation', with: @user_attrs[:password]
        click_button 'Create User'
      end

      it "redirects to root" do
        current_path.should == root_path
      end

      it "shows a flash confirming signup" do
        page.should have_content('User was successfully created.')
      end
    end
  end
end
