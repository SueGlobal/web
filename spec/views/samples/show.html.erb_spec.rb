# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "samples/show" do
  before(:each) do
    @sample = assign(:sample, stub_model(Sample))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
