# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "sources/show" do
  before(:each) do
    @source = assign(:source, create(:source))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
