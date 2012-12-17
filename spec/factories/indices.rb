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
    root true
    ignore do
      segments_count 2
    end

    after(:create) do |index, evaluator|
      create_list(:index_segment,
                  evaluator.segments_count,
                  index: index)
    end
  end
end
