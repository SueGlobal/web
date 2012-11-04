# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :other_study do
    description "MyText"
    notes "MyText"
    basic_question
    software_question
    funding_question
    information_question
    university
  end
end
