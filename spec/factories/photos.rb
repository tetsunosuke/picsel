FactoryBot.define do
  factory :photo do
    # title {"fruit"}
    sequence(:title){ |n| "photo #{n}" }
    caption "A test photo."
    association :owner

    trait :with_hashtags do
      # hashtagからcreate要請のあったphotofact内でさらにphotoをcreateしているから無限ループが怒っている
      after(:create) {|photo| create_list(:hashtag, 5, photo: photo)}
    end
  end
end
