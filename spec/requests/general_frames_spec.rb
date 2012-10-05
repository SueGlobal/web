# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "GeneralFrames" do
  let(:general_frame) { create :general_frame }
  let(:university) { general_frame.university }

  describe "GET /general_frames" do
    it "works! (now write some real specs)" do
      get university_general_frames_path(university)
      response.status.should be(200)
    end
  end
end
