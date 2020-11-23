FactoryBot.define do
  factory :hashtag_photo do
    association :photo
    association :hashtag
  end
end
