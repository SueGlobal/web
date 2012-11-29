# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sample do
    index
    taken_at "2012-11-29 13:11:24"
    periodicity
    source
    methodology_url "http://methodology.com"
  end
end
