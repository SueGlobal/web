# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :segment do
    name "MyString"
    slug "MyString"
    segmentation_variable nil
  end
end
