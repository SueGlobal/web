# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "universities/show" do
  before(:each) do
    view.lookup_context.prefixes << "application"
    @university = assign(:university, UniversityDecorator.decorate(create(:university)))
  end

  before :each do
    view.stub(:can?).with(any_args()).and_return true
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end

  it "renders the edit link it user can edit university" do
    view.stub(:can?).with(:edit, @university).and_return true
    render

    expect(rendered).to include(edit_university_path(@university))
  end

  it "does not renders a link if user cannot edit it" do
    view.stub(:can?).with(:edit, @university).and_return false
    render

    expect(rendered).not_to include(edit_university_path(@university))
  end

  it "renders 'university_dependent_model_list' partial for each dependent model" do
    render

    expect(rendered).to render_template(partial: '_university_dependent_model_list', count: 9)
  end
end
