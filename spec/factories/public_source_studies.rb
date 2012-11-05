# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :public_source_study do
    university
    basic_question
    class_year_question
    funding_question
    information_question
    software_question
    source_question
    slug "MyText"
    variables "var1, var2"
    population "some strange population"
  end
end
