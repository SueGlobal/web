require 'spec_helper'

describe "journals/new" do
  before(:each) do
    assign(:journal, stub_model(Journal).as_new_record)
  end

  it "renders new journal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => journals_path, :method => "post" do
    end
  end
end
