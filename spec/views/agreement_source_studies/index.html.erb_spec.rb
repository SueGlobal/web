# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "agreement_source_studies/index" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    @university = assign(:university, create(:university))
    assign(:agreement_source_studies, [
      create(:agreement_source_study, university: @university),
      create(:agreement_source_study, university: @university)
    ])
  end

  it "renders a list of agreement_source_studies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
