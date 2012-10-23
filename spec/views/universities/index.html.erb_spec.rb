# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "universities/index" do
  before(:each) do
    assign(:universities, UniversityDecorator.decorate([
      create(:university),
      create(:university)
    ]))
  end

  it "renders a list of universities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end

  it "renders a new link if user can create a university" do
    view.stub(:can?).with(any_args()).and_return true
    view.stub(:can?).with(:new, University).and_return true
    render

    expect(rendered).to include(new_university_path)
  end

  it "renders no new link if user cannot create a university" do
    view.stub(:can?).with(any_args()).and_return true
    view.stub(:can?).with(:new, University).and_return false
    render

    expect(rendered).not_to include(new_university_path)
  end
end
