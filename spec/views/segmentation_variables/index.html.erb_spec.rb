# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "segmentation_variables/index" do
  before(:each) do
    assign(:segmentation_variables, [
      stub_model(SegmentationVariable),
      stub_model(SegmentationVariable)
    ])
  end

  it "renders a list of segmentation_variables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
