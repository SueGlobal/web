# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "database_studies/new" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @database_study = assign(:database_study, build(:database_study, university: plain_university))
    @path = assign(:path, [@university, @database_study])
  end

  it "renders new database_study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => university_database_studies_path(@path), :method => "post" do
    end
  end

  it_behaves_like "rendering questions forms", *DatabaseStudy.questions
end
