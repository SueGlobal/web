# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :index do
    slug "MyString"
    name "MyText"
    description "MyText"
    source
    periodicity
    methodology_url "MyText"
    ignore do
      segmentation_variable_count 2
    end

    after(:create) do |index, evaluator|
      create_list(:index_segmentation_variable,
                  evaluator.segmentation_variable_count,
                  index: index)
    end
  end
end
