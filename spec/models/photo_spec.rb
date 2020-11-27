require 'rails_helper'

RSpec.describe Photo, type: :model do
    #コールバックを使用したくさんのメモが付いていること確認する
    it "can have many notes" do
        photo = FactoryBot.create(:photo, :with_hashtags)
        expect(photo.hashtags.length).to eq 5
    end
end