# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "achieved_activities/new" do
  before(:each) do
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @achieved_activity = assign(:achieved_activity, plain_university.achieved_activities.build)
    @path = assign(:path, [@university, @achieved_activity])
  end

  it "renders new achieved_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => university_achieved_activities_path(@path), :method => "post" do
    end
  end
end
