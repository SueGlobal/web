# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ApplicationHelper do

  describe '.years_for_select' do

    it "returns an asc array if start year < end year" do
      result = years_for_select start_year: 2000, end_year: 2001
      expect(result.map(&:first)).to eql(["2000", "2001"])
    end

    it "returns a desc array if start year > end year" do
      result = years_for_select start_year: 2001, end_year: 2000
      expect(result.map(&:first)).to eql(["2001", "2000"])
    end
  end
end
