# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "other_studies/new" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @other_study = assign(:other_study, build(:other_study, university: plain_university))
    @path = assign(:path, [@university, @other_study])
  end

  it "renders new other_study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => university_other_studies_path(@path), :method => "post" do
    end
  end

  it_behaves_like 'rendering questions forms', *OtherStudy.questions
end
