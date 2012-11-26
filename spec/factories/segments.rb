# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :segment do
    name "MyString"
    segmentation_variable
  end
end
