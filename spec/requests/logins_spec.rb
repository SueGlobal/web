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
      shows_input_fields
    end

    context "with valid data" do
      let(:user_attrs) { attributes_for :user }
      before :each do
        lambda{
        fill_form user_attrs
        submit_form
        }.should change(User, :count).by(1)
      end

      it "redirects to root" do
        current_path.should == root_path
      end

      it "shows a flash confirming signup" do
        page.should have_content('User was successfully created.')
      end
    end

    context "with an already taken email" do
      let!(:user) { create :user }
      let(:new_attrs) do
        attributes_for(:user).tap {|x| x[:email] = user.email}
      end

      before :each do
        lambda {
          fill_form new_attrs
          submit_form
        }.should_not change(User, :count)
      end

      it 'renders the form' do
        shows_input_fields
      end

      it 'shows one error' do
        page.should have_css('div#error_explanation ul li', count: 1)
      end
    end

    context "without a proper password confirmation" do
      let(:user_attrs) do
        attributes_for(:user).tap {|x| x[:password_confirmation] = "a#{x[:password_confirmation]}"}
      end

      before :each do
        lambda{
          fill_form user_attrs
          submit_form
        }.should_not change(User, :count)
      end

      it "renders the form" do
        shows_input_fields
      end

      it 'shows one error' do
        page.should have_css('div#error_explanation ul li', count: 1)
      end
    end

    def shows_input_fields
      [:email, :password, :password_confirmation].each do |field|
        page.should have_xpath("//input[@name='user[#{field.to_s}]']")
      end
    end
    def submit_form
      click_button 'Create User'
    end

    def fill_form attrs
      fill_in 'Email', with: attrs[:email]
      fill_in 'Password', with: attrs[:password]
      fill_in 'Password confirmation', with: (attrs[:password_confirmation] || attrs[:password])
    end
  end
end
