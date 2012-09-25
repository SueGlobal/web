# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :university do
    sequence(:name){|n| "University #{n}" }
    sequence(:abbreviation){|n| "u#{n}" }
    province
  end
end
