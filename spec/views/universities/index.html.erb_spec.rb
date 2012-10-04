# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "universities/index" do
  before(:each) do
    assign(:universities, [
      create(:university),
      create(:university)
    ])
  end

  it "renders a list of universities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
