# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "ActivitiesSearches" do
  describe "GET /activities_searches" do
    it "filters the universities" do

      university = create :university
      other_university = create :university

      create :achieved_activity, year: Time.now.year - 1, university: university, studies_on_students: true

      visit activities_search_path

      within 'form.new_activity_query' do
        check 'activity_query[studies_on_students]'
        find('input[type=submit]').click
      end

      expect(page).to have_selector('table > tbody > tr', count: 1)
      expect(page).to have_content(university.abbreviation)
      expect(page).to have_no_content(other_university.abbreviation)
    end
  end
end
