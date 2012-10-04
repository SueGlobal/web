# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "universities/edit" do
  before(:each) do
    @university = assign(:university, stub_model(University))
  end

  it "renders the edit university form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => universities_path(@university), :method => "post" do
    end
  end
end
