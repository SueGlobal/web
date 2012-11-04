# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "other_studies/index" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    @university = assign(:university, create(:university))
    assign(:other_studies, [
      create(:other_study, university: @university),
      create(:other_study, university: @university)
    ])
  end

  it "renders a list of other_studies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
