FactoryGirl.define do
  factory :user do
    #name "Michael Hartl"
    #email "michael@example.com"
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end
end
