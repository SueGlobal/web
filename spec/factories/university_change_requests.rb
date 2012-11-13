# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :university_change_request do
    university
    user
    state 'pending'
    token "MyString"

    trait :pending do
      state 'pending'
    end

    trait :done do
      state 'done'
    end
  end
end
