FactoryGirl.define do
  factory :text do
    sequence(:body) { |number| "QuoteBody#{number}" }
  end
end
