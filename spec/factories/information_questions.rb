# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :information_question do
    university_government_check false
    association :university_government_periodicity, factory: :periodicity
    social_council_check false
    association :social_council_periodicity, factory: :periodicity
    faculties_management_check false
    association :faculties_management_periodicity, factory: :periodicity
    university_other_check false
    association :university_other_periodicity, factory: :periodicity
    university_other_description "MyText"
    students_check false
    association :students_periodicity, factory: :periodicity
    prestudent_check false
    association :prestudent_periodicity, factory: :periodicity
    counselor_check false
    association :counselor_periodicity, factory: :periodicity
    students_parents_check false
    association :students_parents_periodicity, factory: :periodicity
    prestudents_parents_check false
    association :prestudents_parents_periodicity, factory: :periodicity
    society_check false
    association :society_periodicity, factory: :periodicity
    employers_check false
    association :employers_periodicity, factory: :periodicity
    public_administrations_check false
    association :public_administrations_periodicity, factory: :periodicity
    external_other_check false
    association :external_other_periodicity, factory: :periodicity
    external_other_description "MyText"
  end
end
