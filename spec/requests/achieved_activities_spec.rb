# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "AchievedActivities" do
  describe "GET /achieved_activities" do
  end

  describe "add new activity" do
    it "something" do
      university = create :university
      password = '123456'
      user = create :user, :active, password: password, university: university

      login_with user.email, password
      visit new_university_achieved_activity_path(university)
    end
  end
end
