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

  trait :reset_password do
    after(:create) do |u|
      u.reset_password_token = "some_random_token_#{rand.to_s[2..-1]}"
      u.reset_password_email_sent_at = Time.now
      u.reset_password_token_expires_at = 5.days.from_now
      u.save
    end
  end

  trait :locked do
    after :create do |u|
      u.failed_logins_count = 50
      u.lock_expires_at = (Time.now + 10.minutes)
      u.save
    end
  end
end
