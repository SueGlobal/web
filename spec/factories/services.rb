# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    sequence(:name){ |n| "Service #{n}" }
    sequence(:dependency){ |n| "Dependency #{n}" }
    sequence(:slug) { |n| "slug-n" }
    university
  end
end
