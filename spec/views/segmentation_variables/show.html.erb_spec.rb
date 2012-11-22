# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "segmentation_variables/show" do
  before(:each) do
    @segmentation_variable = assign(:segmentation_variable, create(:segmentation_variable, value_count: 2))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
