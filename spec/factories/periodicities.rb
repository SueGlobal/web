# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :periodicity do
    periodicity_type "MyString"
    other_description "MyText"
    periodic nil
  end
end
