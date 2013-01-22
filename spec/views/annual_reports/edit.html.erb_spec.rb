require 'spec_helper'

describe "annual_reports/edit" do
  before(:each) do
    @annual_report = assign(:annual_report, stub_model(AnnualReport))
  end

  it "renders the edit annual_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => annual_reports_path(@annual_report), :method => "post" do
    end
  end
end
