# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "agreement_source_studies/edit" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @agreement_source_study = assign(:agreement_source_study, create(:agreement_source_study, university: plain_university))
    @path = assign(:path, @agreement_source_study)
  end

  it "renders the edit agreement_source_study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => @path, :method => "post" do
    end
  end

  it_behaves_like "rendering questions forms", *AgreementSourceStudy.questions
end
