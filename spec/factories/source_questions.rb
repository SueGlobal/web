# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :source_question do
    source "MyText"
    bias "MyText"
    data_format "MyText"
    studiable nil
  end
end
