FactoryGirl.define do
  factory :merit do
    username { FFaker::Internet.user_name }
  end
end

