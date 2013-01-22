require 'spec_helper'

describe "annual_reports/show" do
  before(:each) do
    @annual_report = assign(:annual_report, stub_model(AnnualReport))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
