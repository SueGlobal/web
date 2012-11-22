# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "segmentation_variables/new" do
  before(:each) do
    view.lookup_context.prefixes << "application"
    assign(:segmentation_variable, build(:segmentation_variable))
  end

  it "renders new segmentation_variable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => segmentation_variables_path, :method => "post" do
    end
  end
end
