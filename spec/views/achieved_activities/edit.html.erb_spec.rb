# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "achieved_activities/edit" do
  before(:each) do
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @achieved_activity = assign(:achieved_activity, create(:achieved_activity, university: plain_university))
    @path = assign(:path, @achieved_activity)
  end

  it "renders the edit achieved_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => edit_achieved_activity_path(@achieved_activity), :method => "post" do
    end
  end
end
