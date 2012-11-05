# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "AgreementSourceStudies" do
  describe "GET /agreement_source_studies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      @university = create(:university)
      get university_agreement_source_studies_path(@university)
      response.status.should be(200)
    end
  end
end
