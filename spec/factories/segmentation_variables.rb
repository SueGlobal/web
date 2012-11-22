# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :segmentation_variable do
    slug "MyString"
    name "MyText"
    ignore do
      value_count 1
    end

    after :create do |var, evaluator|
      create_list :segmentation_variable_value, evaluator.value_count, segmentation_variable: var
    end
  end
end
