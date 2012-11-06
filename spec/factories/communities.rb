# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :community do
    sequence(:name) { |n| "Community#{n}" }
  end
end
