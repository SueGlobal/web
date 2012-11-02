# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "employer_studies/index" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    @university = assign(:university, create(:university))
    assign(:employer_studies, [
      create(:employer_study, university: @university),
      create(:employer_study, university: @university)
    ])
  end

  it "renders a list of employer_studies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
