FactoryGirl.define do
  factory :user do
    username { FFaker::Internet.user_name }
    name { FFaker::Name.name }
  end
end
