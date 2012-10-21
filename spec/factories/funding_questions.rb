# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :funding_question do
    fixed_state_funding false
    variable_state_funding false
    fixed_private_funding false
    variable_private_funding false
    studiable nil
  end
end
