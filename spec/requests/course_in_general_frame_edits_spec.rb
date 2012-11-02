# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "CourseInGeneralFrameEdits" do
  context "when editing a general frame" do

    let(:general_frame_year) { Time.now.year - 1 }
    let(:general_frame) { create :general_frame, year: general_frame_year }
    let(:password) { "123456" }
    let(:user) { create :user, :active, :admin, password: password, password_confirmation: password }

    before :each do
      login_with user.email, password
      visit edit_general_frame_path(general_frame)
    end

    it "has general frame's year selected" do
      find("select[name='general_frame[year]']").value.should eq(general_frame_year.to_s)
    end
  end
end
