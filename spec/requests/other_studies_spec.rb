# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "OtherStudies" do
  describe "GET /other_studies" do
    it "works! (now write some real specs)" do
      @university = create :university
      get university_other_studies_path(@university)
      response.status.should be(200)
    end
  end
end
