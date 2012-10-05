# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "general_frames/show" do
  before(:each) do
    @general_frame = assign(:general_frame, create(:general_frame))
  end

  it "renders attributes in <p>" do
    render
  end
end
