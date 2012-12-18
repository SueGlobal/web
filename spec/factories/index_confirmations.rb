# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :index_confirmation do
    user nil
    index nil
    accepted false
    accepted_at "2012-12-18 10:25:50"
  end
end
