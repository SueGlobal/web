# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "general_frames/edit" do
  before(:each) do
    plain_university = create :university
    @university = assign(:university, UniversityDecorator.decorate(plain_university))
    @general_frame = assign(:general_frame, create(:general_frame, university: plain_university))
    @path = assign(:path, @general_frame)
  end

  it "renders the edit general_frame form" do
    render

    assert_select "form", :action => edit_general_frame_path(@path), :method => "post" do
    end
  end
end
