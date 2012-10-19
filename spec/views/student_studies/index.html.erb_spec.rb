# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "student_studies/index" do
  before(:each) do
    @university = assign(:university, create(:university))
    assign(:student_studies, [
      create(:student_study, university: @university),
      create(:student_study, university: @university)
    ])
  end

  it "renders a list of student_studies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
