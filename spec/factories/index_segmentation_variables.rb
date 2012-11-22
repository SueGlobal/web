# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :index_segmentation_variable do
    primary false
    index nil
    segmentation_variable nil
  end
end
