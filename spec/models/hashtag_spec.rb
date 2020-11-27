require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  # #検索文字列に一致するハッシュネームを返す
  xit "returns hashtags that match the search term" do
    user = User.create(
      first_name: "田中",
    )
    photo = Photo.create(
      user: user,
      title: "haru",
      caption: "sakura",
    )
    hashtag1 = photo.hashtags.create(
      id: "1", hashname: "apple", created_at: Time.current + 1.days,updated_at: Time.current + 1.days,
    )
    hashtag2 = photo.hashtags.build(
      id: "2", hashname: "orange", created_at: Time.current + 2.days,updated_at: Time.current + 2.days,
    )
    hashtag3 = photo.hashtags.build(
      id: "1", hashname: "apple", created_at: Time.current + 3.days,updated_at: Time.current + 3.days,
    )
        expect(Hashtag.ransack(hashname: "apple").result).to include(hashtag1, hashtag3)
        expect(Hashtag.ransack(hashname: "orange").result).to_not include(hashtag2)
  end

  #検出結果が一件も該当しなかった場合
  xit "doesnt exist in this scoop" do
    user = User.create(
      first_name: "a",
    )
    photo = Photo.create!(
      user: user,
      title: "haru",
      caption: "sakura",
    )
    # Photo.create(id: ,title:"haru", updated_at: Time.current + 1.days）という書き方でもおっけ
    hashtag1 = photo.hashtags.create(
      id: "1", hashname: "apple", created_at: Time.current + 1.days,updated_at: Time.current + 1.days,
    )
    hashtag2 = photo.hashtags.build(
      id: "2", hashname: "orange", created_at: Time.current + 2.days,updated_at: Time.current + 2.days,
    )
    # byebug
    expect(Hashtag.ransack(hashname_cont: "hashtag").result).to be_empty
    #どこかにカンマがはいってしまっていることを予想したのだが問題無いのでどこがシンタックスエラーなのかわからない
  end

  # ファクトリで関連するデータを生成する
  xit "generates associated data from a factory" do
    hashtag = FactoryBot.create(:hashtag)
    puts "This hashtag's photo is #{hashtag.photos.inspect}"
    # puts "This hashtag's user is #{hashtag.user.inspect}"
  end

  it 'valid factory with has many photos' do
    hashtag = FactoryBot.create(:hashtag, :with_photos)
    expect(hashtag.hashtag_photos.count).to be >= 2
    expect(hashtag.photos.count).to be >= 2
  end

end