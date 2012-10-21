# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sample_question do
    scope "MyText"
    population "MyText"
    sampling_option "non_probabilistic"
    non_probabilistic_description "MyText"
    sampling_type "MyText"
    disintegration_level "MyText"
  end
end
