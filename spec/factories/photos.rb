FactoryBot.define do
  factory :photo do
    sequence(:title){ |n| "photo #{n}" }
    caption "A test photo."
    association :user
  end
end
