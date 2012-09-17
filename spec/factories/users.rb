# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "123456"
    ::User::ROLES.each do |role|

      factory "#{role}_user" do
        roles [role]
      end
    end
  end
end
