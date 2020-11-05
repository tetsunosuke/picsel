class CreateHashtagPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_photos do |t|
      t.references :photo, foreign_key: true
      t.references :hashtag, foreign_key: true
      t.timestamps
    end
  end
end
