# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "samples/new" do
  before(:each) do
    assign(:sample, stub_model(Sample).as_new_record)
  end

  it "renders new sample form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => samples_path, :method => "post" do
    end
  end
end
