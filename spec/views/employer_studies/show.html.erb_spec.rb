# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "employer_studies/show" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @employer_study = assign(:employer_study, create(:employer_study, university: plain_university))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
