require 'spec_helper'

describe "annual_reports/new" do
  before(:each) do
    assign(:annual_report, stub_model(AnnualReport).as_new_record)
  end

  it "renders new annual_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => annual_reports_path, :method => "post" do
    end
  end
end
