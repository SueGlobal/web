# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "student_studies/edit" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @student_study = assign(:student_study, create(:student_study, university: plain_university))
    @path = assign(:path, @student_study)
  end

  it "renders the edit student_study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => @path, :method => "post" do
    end
  end

  it_behaves_like 'rendering questions forms', :sample, :software, :basic, :funding
end
