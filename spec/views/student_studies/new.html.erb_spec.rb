# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "student_studies/new" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @student_study = assign(:student_study, build(:student_study, university: plain_university))
    @path = assign(:path, [@university, @student_study])
  end

  it "renders new student_study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => university_student_studies_path(@path), :method => "post" do
    end
  end
end
