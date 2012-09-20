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

  trait :inactive do
    activation_state = 'pending'
  end

  trait :active do
    after(:create) do |u|
      u.activation_state = 'active'
      u.activation_token = nil
      u.activation_token_expires_at = nil
      u.save
    end
  end
end
