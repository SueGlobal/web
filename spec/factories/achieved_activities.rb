# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :achieved_activity do
    studies_on_students false
    external_practices false
    internal_practices false
    labor_orientation false
    employment_agency false
    external_colaborations false
    research_projects false
    international_dimension false
    other_activities "MyText"
    includes_studies_on_students false
    includes_studies_on_employers false
    includes_public_secondary_sources false
    includes_non_public_secondary_sources false
    includes_university_databases "MyString"
    includes_other_studies false
    university
  end
end
