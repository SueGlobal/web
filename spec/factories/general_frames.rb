# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :general_frame do
    year 2010
    degree_graduates 1
    sequence(:slug) { |n| "slug-#{n}" }
    bachelors_degree_graduates 1
    graduates 1
    specific_qualifications_graduates 1
    phd_graduates 1
    master_graduates 1
    number_of_campus 1
    number_of_qualifications 1
    number_of_masters_degree 1
    number_of_specific_qualifications 1
    number_of_phds 1
    degree_graduates_check false
    bachelors_degree_graduates_check false
    graduates_check false
    specific_qualifications_graduates_check false
    phd_graduates_check false
    master_graduates_check false
    number_of_campus_check false
    number_of_qualifications_check false
    number_of_masters_degree_check false
    number_of_specific_qualifications_check false
    number_of_phds_check false
    university

    trait :all_checks_true do
      degree_graduates_check true
      bachelors_degree_graduates_check true
      graduates_check true
      specific_qualifications_graduates_check true
      phd_graduates_check true
      master_graduates_check true
      number_of_campus_check true
      number_of_qualifications_check true
      number_of_masters_degree_check true
      number_of_specific_qualifications_check true
      number_of_phds_check true
    end
  end
end
