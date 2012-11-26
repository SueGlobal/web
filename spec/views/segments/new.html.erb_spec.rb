# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "segments/new" do
  before(:each) do
    @var = assign(:segmentation_variable, create(:segmentation_variable))
    @segment = assign(:segment, build(:segment, segmentation_variable: @var))
  end

  it "renders new segment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => [@var, @segment], :method => "post" do
    end
  end
end
