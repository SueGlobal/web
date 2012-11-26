# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "indices/edit" do
  before(:each) do
    view.lookup_context.prefixes << "application"
    @index = assign(:index, stub_model(Index))
  end

  it "renders the edit index form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => indices_path(@index), :method => "post" do
    end
  end
end
