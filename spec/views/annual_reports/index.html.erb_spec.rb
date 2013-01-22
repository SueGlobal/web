require 'spec_helper'

describe "annual_reports/index" do
  before(:each) do
    assign(:annual_reports, [
      stub_model(AnnualReport),
      stub_model(AnnualReport)
    ])
  end

  it "renders a list of annual_reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
