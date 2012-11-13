# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "AddUserToUniversities" do
  describe "GET /add_user_to_universities" do
    let(:university) { create :university }
    let(:email) { attributes_for(:user)[:email] }
    before :each do
      login_with user.email, password
      visit add_user_university_path(university)
    end

    context "when user can admin university" do
      let(:password) { "123456" }
      let(:user) { create :user, :active, university: university }

      it "adds the user if it does not exists" do

        expect {
          within "form" do
            fill_in 'add_user[email]', with: email
            find('.form-actions > .btn').click
          end
        }.to change(User, :count).by(1)

        expect(User.find_by_email(email).university).to eq(university)
      end
    end

    context "when user existed peviously" do
      let(:password) { "123456" }
      let(:user) { create :user, :active, university: university }
      let(:other_user) { create :user, :active, university: nil }

      it "add creates a university change request that can do the change" do
        expect {
          within "form" do
            fill_in 'add_user[email]', with: other_user.email
            find('.form-actions > .btn').click
          end
        }.to change(UniversityChangeRequest, :count).by(1)

        visit accept_change_request_path(UniversityChangeRequest.last.token)

        expect(other_user.reload.university).to eq(university)
      end

    end

    context "when user cannot admin university" do
      let(:password) { "123456" }
      let(:user) { create :user, :active, university: nil }

      it "redirects to root" do
        expect(current_path).to eq(root_path)
      end
    end
  end
end
