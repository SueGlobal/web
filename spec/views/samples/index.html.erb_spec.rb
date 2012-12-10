# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "samples/index" do
  before(:each) do
    assign(:samples, [
      stub_model(Sample),
      stub_model(Sample)
    ])
  end

  it "renders a list of samples" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
