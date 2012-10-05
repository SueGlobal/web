# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :general_frame do
    year 2010
    degree_graduates 1
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
    university
  end
end
