# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :field_work_question do
    phone false
    email false
    internet false
    mail false
    interview false
    focus_group false
    other "MyText"
  end
end
