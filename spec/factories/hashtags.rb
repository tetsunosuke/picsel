FactoryBot.define do
  factory :hashtag do
    hashname {"apple"}
    association :hashtag_photo
    user {photo.owner}

    trait :with_photos do
      after(:create) do |hashtag|
        hashtag.photos << FactoryBot.create_list(:photo, 2)
      end
    end

  end
end
