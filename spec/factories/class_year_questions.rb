# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :class_year_question do
    time_from_graduation_type "MyString"
    time_from_graduation_other "MyText"
  end
end
