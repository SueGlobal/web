require 'spec_helper'

describe "public_source_studies/new" do
  before(:each) do
    view.lookup_context.prefixes << "study" << "application"
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @public_source_study = assign(:public_source_study, build(:public_source_study, university: plain_university))
    @path = assign(:path, [@university, @public_source_study])
  end

  it "renders new public_source_study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => university_public_source_studies_path(@path), :method => "post" do
    end
  end

  it_behaves_like "rendering questions forms", *PublicSourceStudy.questions
end
