# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "segmentation_variables/new" do
  before(:each) do
    assign(:segmentation_variable, stub_model(SegmentationVariable).as_new_record)
  end

  it "renders new segmentation_variable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => segmentation_variables_path, :method => "post" do
    end
  end
end
