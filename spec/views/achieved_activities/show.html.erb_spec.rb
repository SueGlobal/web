# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "achieved_activities/show" do
  before(:each) do
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @achieved_activity = assign(:achieved_activity, create(:achieved_activity))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
