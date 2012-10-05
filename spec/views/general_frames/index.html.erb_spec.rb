# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "general_frames/index" do
  before(:each) do
    @university = assign(:university, create(:university))
    assign(:general_frames, [
           create(:general_frame, university: @university),
           create(:general_frame, university: @university)
    ])
  end

  it "renders a list of general_frames" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
