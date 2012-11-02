# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "EmployerStudies" do
  describe "GET /employer_studies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get university_employer_studies_path(create(:university))
      response.status.should be(200)
    end
  end
end
