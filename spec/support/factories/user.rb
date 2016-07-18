FactoryGirl.define do
  factory :user do
    sequence(:username) { |number| "User_#{number}" }
    sequence(:email) { |number| "Email_#{number}@mailinator.com" }
    password 'password'
  end
end
