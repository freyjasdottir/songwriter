FactoryGirl.define do
  factory :song do
    sequence(:title) { |number| "Song_#{number}" }
    sequence(:body) { |number| "Lyrics#{number}" }
  end
end
