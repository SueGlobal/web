require 'spec_helper'

describe "AnnualReports" do
  describe "GET /annual_reports" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get annual_reports_path
      response.status.should be(200)
    end
  end
end
