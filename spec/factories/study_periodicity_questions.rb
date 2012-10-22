# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :study_periodicity_question do
    periodicity "MyString"
    other_description "MyText"
  end
end
