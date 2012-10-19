# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :basic_question do
    title "MyText"
    author "MyText"
    year 1
  end
end
