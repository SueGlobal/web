# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title "MyString"
    description "MyText"
    file "MyString"
    slug "MyString"
    published false

    trait :published do
      published true
    end
  end
end
