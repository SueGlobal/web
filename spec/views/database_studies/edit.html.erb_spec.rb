# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "database_studies/edit" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @database_study = assign(:database_study, create(:database_study, university: plain_university))
    @path = assign(:path, @database_study)
  end

  it "renders the edit database_study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => @path, :method => "post" do
    end
  end

  it_behaves_like "rendering questions forms", *DatabaseStudy.questions
end
