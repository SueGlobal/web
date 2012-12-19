# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :journal do
    title "MyString"
    description "MyText"
    file "MyString"
    slug "MyString"
    published false

    trait :published do
      published true
    end

    trait :draft do
      published false
    end
  end
end
