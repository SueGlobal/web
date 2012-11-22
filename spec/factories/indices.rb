# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :index do
    slug "MyString"
    name "MyText"
    description "MyText"
    source nil
    periodicity nil
    methodology_url "MyText"
  end
end
