# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "achieved_activities/index" do
  before(:each) do
    @university = assign(:university, create(:university))
    assign(:achieved_activities, [
      create(:achieved_activity, university: @university),
      create(:achieved_activity, university: @university)
    ])
  end

  it "renders a list of achieved_activities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
