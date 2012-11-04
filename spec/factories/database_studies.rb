# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :database_study do
    university
    basic_question
    software_question
    funding_question
    information_question
    study_periodicity_question
    description "MyText"
    database "MyText"
    variables "MyText"
    producer "MyText"
    analyzer "MyText"
    notes "MyText"
    slug "MyText"
  end
end
