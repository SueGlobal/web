# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Signup" do
  describe "GET /signup" do
    before :each do
      visit signup_path
    end

    it "shows a textfield" do
      expect(page).to have_xpath("//input[@type='text']")
    end

    it "shows a textfield for email, password and password confirmation" do
      shows_input_fields
    end

    context "with valid data" do
      let(:user_attrs) { attributes_for :user }
      before :each do
        expect {
          fill_form user_attrs
          submit_form
        }.to change(User, :count).by(1)
      end

      it "redirects to root" do
        expect(current_path).to  eql(root_path)
      end

      it "shows a flash confirming signup" do
        expect(page).to have_content(I18n.t('controllers.users.create.notice'))
      end
    end

    context "with an already taken email" do
      let!(:user) { create :user }
      let(:new_attrs) do
        attributes_for(:user).tap {|x| x[:email] = user.email}
      end

      before :each do
        expect {
          fill_form new_attrs
          submit_form
        }.not_to change(User, :count)
      end

      it 'renders the form' do
        shows_input_fields
      end

      it 'shows one error' do
        expect(page).to have_css('div.control-group.string.error', count: 1)
      end
    end

    context "without a proper password confirmation" do
      let(:user_attrs) do
        attributes_for(:user).tap {|x| x[:password_confirmation] = "a#{x[:password_confirmation]}"}
      end

      before :each do
        expect {
          fill_form user_attrs
          submit_form
        }.not_to change(User, :count)
      end

      it "renders the form" do
        shows_input_fields
      end

      it 'shows one error' do
        expect(page).to have_css('div.control-group.password.error', count: 1)
      end
    end

    def shows_input_fields
      [:email, :password, :password_confirmation].each do |field|
        expect(page).to have_xpath("//input[@name='user[#{field.to_s}]']")
      end
    end
    def submit_form
      within('form#new_user') do
        find('.js-submit').click
      end
    end

    def fill_form attrs
      within("form.new_user") do
        find('.js-email').set attrs[:email]
        find('.js-password').set attrs[:password]
        find('.js-password-confirmation').set (attrs[:password_confirmation] || attrs[:password])
      end
    end
  end
end
