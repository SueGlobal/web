# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Logout" do
  describe "GET /logout" do
    let!(:user) { create :user }

    before(:each) do
      login_with user.email, user.password
      visit logout_path
    end

    it "redirects to root" do
      current_path.should == root_path
    end

    it "shows a notice" do
      page.should have_css("p#notice")
    end

    it "shows login option" do
      page.should have_content(login_text)
    end
  end
end
