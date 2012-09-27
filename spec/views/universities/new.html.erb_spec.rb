require 'spec_helper'

describe "universities/new" do
  before(:each) do
    assign(:university, stub_model(University).as_new_record)
  end

  it "renders new university form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => universities_path, :method => "post" do
    end
  end
end
