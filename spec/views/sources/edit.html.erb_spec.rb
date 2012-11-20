# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "sources/edit" do
  before(:each) do
    @source = assign(:source, stub_model(Source))
  end

  it "renders the edit source form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sources_path(@source), :method => "post" do
    end
  end
end
