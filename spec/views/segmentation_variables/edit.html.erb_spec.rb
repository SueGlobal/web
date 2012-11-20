# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "segmentation_variables/edit" do
  before(:each) do
    @segmentation_variable = assign(:segmentation_variable, stub_model(SegmentationVariable))
  end

  it "renders the edit segmentation_variable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => segmentation_variables_path(@segmentation_variable), :method => "post" do
    end
  end
end
