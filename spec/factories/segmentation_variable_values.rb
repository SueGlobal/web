# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :segmentation_variable_value do
    value "MyString"
    sequence(:order) { |n| n}
    segmentation_variable
  end
end
