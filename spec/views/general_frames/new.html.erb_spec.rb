# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "general_frames/new" do
  before(:each) do
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @general_frame = assign(:general_frame, plain_university.general_frames.build)
    @path = assign(:path, [@university, @general_frame])
  end

  it "renders new general_frame form" do
    render

    assert_select "form", :action => university_general_frames_path(@path), :method => "post" do
    end
  end
end
