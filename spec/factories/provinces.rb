# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :province do
    sequence(:id_prov){ |n| n }
    sequence(:name){|n| "Province#{n}"}
  end
end
