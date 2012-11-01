# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :university do
    sequence(:name){|n| "University #{n}" }
    sequence(:abbreviation){|n| "u#{n}" }
    sequence(:slug) { |n| "slug-#{n}" }
    admin_emails "e1@s.com, e2@s.com, e3@s.com"
    province
  end
end
