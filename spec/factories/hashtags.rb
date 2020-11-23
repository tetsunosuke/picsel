FactoryBot.define do
  factory :hashtag do
    hashname {"apple"}
    association :hashtag_photo
  end
end
